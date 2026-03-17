#!/usr/bin/env bash
#
# Bootstraps the ADK MCP Lab project environment.
# Sets up a virtual environment, configures the uv package manager, 
# and prepares the hatchling build system natively.

set -euo pipefail

# Constants
readonly PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly VENV_DIR="${PROJECT_ROOT}/.venv"

# Colors for output
readonly GREEN=$'\033[0;32m'
readonly YELLOW=$'\033[1;33m'
readonly NC=$'\033[0m'

log_info() {
    echo -e "${YELLOW}INFO:${NC} $1"
}

log_success() {
    echo -e "${GREEN}SUCCESS:${NC} $1"
}

setup_environment() {
    if [[ ! -d "${VENV_DIR}" ]]; then
        log_info "Creating virtual environment at .venv..."
        python3 -m venv "${VENV_DIR}"
    fi

    # Activate virtual environment
    source "${VENV_DIR}/bin/activate"

    if ! command -v uv &> /dev/null; then
        log_info "Installing the uv package manager..."
        pip install -q uv
    fi
}

initialize_project() {
    cd "${PROJECT_ROOT}"

    if [[ -f "pyproject.toml" ]]; then
        return 0
    fi

    log_info "Initializing new uv project..."
    
    # Natively inject hatch build-backend into pyproject.toml
    uv init . --build-backend hatch > /dev/null
    
    # Append the custom src package mapping explicitly needed by hatchling 
    # for flat layouts.
    log_info "Configuring build system for custom 'src' mapping..."
    {
        echo ""
        echo "[tool.hatch.build.targets.wheel]"
        echo "packages = [\"src\"]"
    } >> pyproject.toml
}

main() {
    log_info "Bootstrapping project environment..."

    setup_environment
    initialize_project

    log_info "Syncing dependencies..."
    cd "${PROJECT_ROOT}"
    uv sync > /dev/null

    echo ""
    log_success "Setup complete! Your environment is ready."
    echo "To activate it, run: source .venv/bin/activate"
}

main "$@"
