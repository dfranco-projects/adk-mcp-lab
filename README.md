# Google ADK Lab

Runnable, minimal examples covering advanced features of Google Agent Development Kit (ADK).

Each directory is self-contained. Focus is on real patterns: stateful agents, RAG, MCP, A2A, evaluation, and production workflows.

Version used: 1.27.2

---

## Learning path

This repository is structured as a progressive learning path, numbered `00` to `14`. Start at the beginning or jump to the concept you need.

```
src/
  00_intro/                 # Basic setup, API keys, adk run/web
  01_basic_agent/           # Simple LlmAgent, core attributes
  02_tools/                 # Function tools, built-in tools (search, code exec)
  03_models/                # LiteLLM, Vertex Model Garden integration
  04_structured_outputs/    # Pydantic schemas, JSON enforcement
  05_state_session/         # InMemory vs Database session services, State dict
  06_multi_agent/           # Coordinator + subagents, LLM-routed
  07_workflows/             # Sequential, Parallel, and Loop agents
  08_rag/                   # Vector stores, custom retrieval, Google RAG
  09_mcp/                   # Local stdio/HTTP servers, remote servers
  10_a2a/                   # Agent-to-Agent protocol communication
  11_evaluation/            # adk eval, golden datasets, custom metrics
  12_observability/         # OpenTelemetry tracing, debugging
  13_deployment/            # Cloud Run, Vertex AI Agent Engine, Docker
  14_advanced/              # Streaming, context caching, custom runner overrides
```

Each folder:
- minimal example
- focused README
- reproducible setup

---

## Requirements

- Python 3.11+
- `uv` (recommended) or `pip`
- API key (Gemini or other via LiteLLM)

Optional:
- Docker
- Node.js (for MCP servers)
- GCP account (for deployment / tracing)

---

## Setup

```bash
git clone https://github.com/your-username/adk-lab
cd adk-lab
make install

cp .env.example .env
# set API keys if needed
```

Run any example:

```bash
adk run agents/basics/
adk web agents/basics/
```

---

## Design principles

- Minimal but realistic
- No hidden abstractions
- Local-first (no paid infra required)
- Each feature isolated and composable
- Production patterns over toy demos

---

## Focus areas

This repo emphasizes areas that are usually under-documented:

- Evaluation pipelines (not just single tests)
- End-to-end RAG (retrieval + reasoning)
- MCP as a real integration layer (not demos)
- A2A beyond trivial examples
- Custom agent control (beyond default loop)
- Observability and debugging workflows
