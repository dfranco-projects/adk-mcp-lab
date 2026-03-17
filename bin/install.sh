#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Determine project root and virtual environment path
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="$PROJECT_ROOT/.venv"

echo -e "${YELLOW}Bootstrapping project environment...${NC}"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment at .venv..."
    python3 -m venv "$VENV_DIR"
fi

# Activate virtual environment
source "$VENV_DIR/bin/activate"

# Ensure uv is installed
if ! command -v uv &> /dev/null; then
    echo "Installing uv package manager..."
    pip install -q uv
fi

cd "$PROJECT_ROOT"

# Initialize project if pyproject.toml is missing
if [ ! -f "pyproject.toml" ]; then
    echo "Initializing new uv project..."
    uv init .
    
    # Configure build system to package the src directory
    echo "Configuring build system for src directory..."
    cat << 'EOF' >> pyproject.toml

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[tool.hatch.build.targets.wheel]
packages = ["src"]
EOF
fi

# Sync dependencies
echo "Syncing dependencies..."
uv sync

echo -e "\n${GREEN}✅ Setup complete! Your environment is ready.${NC}"
echo "To activate it, run: source .venv/bin/activate"
