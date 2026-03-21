# Google ADK Lab

Runnable, minimal examples covering advanced features of Google Agent Development Kit (ADK).

Each directory is self-contained. Focus is on real patterns: stateful agents, RAG, MCP, A2A, evaluation, and production workflows.

Version used: 1.27.2

---

## What’s covered

### Core
- Agents (tool-calling, multi-step reasoning)
- Custom agents (override execution loop, `run` / control flow)
- Structured tools (Python functions, OpenAPI, adapters)
- Dynamic tool loading (`BaseToolset`)
- YAML-defined agents (config-first workflows)

### State & Memory
- Session-based state (multi-turn, persistent)
- Scoped memory (session / user / app)
- Artifacts (documents, images, audio, structured blobs)
- Persistence backends (in-memory, SQLite, cloud)

### Retrieval (RAG)
- Local RAG with Chroma
- MCP-based retrieval pipelines
- Custom retrieval tools (chunking, embeddings, ranking)
- Context injection strategies

### Multi-agent systems
- Workflow agents (sequential, parallel, loop)
- Coordinator + sub-agents patterns
- LLM-routed agents
- Agent-as-tool composition

### MCP (Model Context Protocol)
- Local MCP servers (stdio)
- Remote MCP servers (HTTP/SSE)
- Tool discovery and dynamic integration
- Custom MCP server examples

### A2A (Agent-to-Agent)
- Exposing agents as services
- Cross-agent communication
- Cross-framework interoperability

### Evaluation
- Eval sets (multi-turn scenarios)
- Tool correctness validation
- Response quality evaluation
- Custom metrics pipelines
- CI integration (automated eval runs)

### Observability
- Execution tracing (local + cloud)
- OpenTelemetry integration
- Debugging via `adk web`
- Run inspection, replay, and step tracing

### Streaming & Interaction
- SSE streaming
- Real-time responses
- Audio / video pipelines

### Optimization
- Context caching
- `adk optimize`
- Cost / latency tradeoffs

### Deployment
- Local runner
- Docker
- Cloud Run (free tier viable)
- Vertex AI Agent Engine

---

## Repo structure

```
src/
  agents/
    basics/
    custom/             # custom execution loop / overrides
    yaml/
    state/
    memory/
    artifacts/
    multi/
    graph/              # (2.0 alpha)

  tools/
    custom/
    rag/
    mcp/
    openapi/

  mcp/
    local_stdio/
    local_http/
    remote/

  a2a/
    basic/
    cross_framework/

  eval/
    cli/
    programmatic/
    pipelines/

  observability/
  deploy/
  models/
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
