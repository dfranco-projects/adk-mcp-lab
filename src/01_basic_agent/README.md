# 01 - The Basic Agent

This is the simplest possible implementation of an AI agent using the Agent Development Kit (ADK). It defines a `root_agent`, gives it a model (`gemini-2.5-flash`), and sets a basic instruction prompt.

It does **not** have tools, workflows, or any complex state management yet, just a pure LLM ready to chat.

## Prerequisites: Google API Key

Before running any agent that relies on a Gemini model, you need a Google API key.

1. Go to [Google AI Studio](https://aistudio.google.com/).
2. Click **Get API key** and generate a new key.
3. Add it to your `.env` file at the root of the project:
   ```env
   GOOGLE_API_KEY="your-api-key-here"
   ```
*(If you used `make install`, your `.env` file should already be copied from `.env.example`.)*

## Recommended Folder Structure

While you can structure your Python code however you want, ADK projects generally follow a pattern separating the agent logic from tools and entry points. Even though this example is minimal, you'll see this structure in larger projects:

```text
src/
  my_agent/
    __init__.py       # Exposes the main agent (e.g. `from .agent import root_agent`)
    agent.py          # The Agent definition and prompts
    tools/            # Custom python functions the agent can call
      __init__.py
      search.py
      calculator.py
    plugins/          # Third-party integrations (like OpenTelemetry or Memory)
      __init__.py
```

By placing `from .agent import root_agent` in your `__init__.py`, you let the ADK framework treat the entire folder as a single runnable module.

### Best Practice: Agent Naming

Notice that the folder is named `01_basic_agent` but inside `agent.py`, the agent is named `basic_agent`. 

**Why?** ADK agent names **must be valid Python identifiers** (they cannot start with a number, no hyphens, no special characters). While ADK does not strictly require the folder name to be identical to the agent name, keeping them as close as possible (stripping the numbering prefix) makes navigating traces and telemetry logs significantly easier when your system grows to 50+ agents.

## Deep Dive: The `Agent` Class

In `agent.py`, we instantiate the `Agent` class. Every agent requires a few core fields to function properly:

- **`name`**: A unique, valid Python identifier (no spaces, no leading numbers) for your agent. Used heavily in telemetry, tracing, and multi-agent routing.
- **`model`**: The underlying LLM to use. ADK defaults to Google's models via Model Garden (e.g., `gemini-2.5-flash`), but supports any provider via `LiteLLM`.
- **`description`**: A short explanation of what what your agent does. In a multi-agent system, the "coordinator" reads this description to decide if it should hand off a user's request to this specific agent.
- **`instruction`**: The system prompt. This dictates the agent's persona, its rules of engagement, and its ultimate goal.

## Running the Agent

ADK provides two primary ways to interact with your agent from the command line once you have initialized your Python environment (`source .venv/bin/activate`).

### 1. `adk web` (Visual UI)
The easiest way to test your agent, view traces of its thought process, and save evaluation test cases.

```bash
adk web src/01_basic_agent
```
Then, open your browser to `http://localhost:8080`.

### 2. `adk run` (Terminal REPL)
If you just want a fast, text-based interactive chat right inside your terminal:

> **Important Warning for `adk run`:**
> The `adk web` command works perfectly even if your `__init__.py` only exposes a `root_agent`. 
> However, if your folder name is not a valid Python identifier (like `01_basic_agent`), `adk run` will crash because it tries to auto-generate an `App` session named after the folder. 
> To bypass this, you must explicitly define an `App` in `agent.py` and export it in `__init__.py`:
> ```python
> from google.adk.apps import App
> app = App(name="basic_app", root_agent=root_agent)
> ```

```bash
adk run src/01_basic_agent
```
Type your message, hit Enter, and type `exit` when you're done.
