# Google ADK Lab

Runnable, minimal examples covering advanced features of Google Agent Development Kit (ADK).

Each directory is self-contained. Focus is on real patterns: stateful agents, RAG, MCP, A2A, evaluation, and production workflows.

Version used: 2.0.0a1

---

## Learning path

This repository is structured as a progressive learning path, numbered `00` to `16`.

> **For advanced developers:** If you already know basic tool calling and state management, **skip straight to `06_multi_agent` or `09_mcp`**. The earlier folders are foundational.

```
src/
  00_intro/                 # Basic setup, API keys, adk run/web
  01_basic_agent/           # Simple LlmAgent, core attributes, custom runner loops
  02_tools/                 # Function tools, built-in (search, code exec), OpenAPI, BaseToolset
  03_models/                # LiteLLM, Vertex Model Garden integration
  04_structured_outputs/    # Pydantic schemas, JSON enforcement
  05_state_session/         # InMemory vs Database session services, artifacts, memory scoping
  06_multi_agent/           # Coordinator + subagents, LLM-routed, agent-as-tool
  07_workflows/             # Sequential, Parallel, and Loop workflow agents
  08_rag/                   # Vector stores, custom retrieval pipelines, Google RAG tool
  09_mcp/                   # Local stdio/HTTP servers, remote servers, dynamic integration
  10_a2a/                   # Agent-to-Agent protocol, cross-framework communication
  11_evaluation/            # adk eval, golden datasets, custom metrics, CI pipelines
  12_observability/         # OpenTelemetry tracing, run inspection, debugging
  13_deployment/            # Local runner, Cloud Run, Vertex AI Agent Engine, Docker
  14_advanced/              # SSE streaming, audio/video pipelines, context caching, optimize
  15_yaml_agents/           # Config-first workflows, visual agent builder imports
  16_graph_workflows/       # ADK 2.0 alpha graph-based workflows
```

Each folder:
- minimal example
- focused README
- reproducible setup

---

## Requirements

- Python 3.11+
- API key (Gemini or other via LiteLLM)
- Docker (for deployment / isolated execution examples)
- Node.js (for local MCP servers)
- GCP account (for deployment / Vertex AI tracing)

---

## Setup

```bash
git clone https://github.com/your-username/adk-lab
cd adk-lab
make install

cp .env.example .env
# set your API keys
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
