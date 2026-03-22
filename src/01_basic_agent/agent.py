from google.adk.agents import Agent
from google.adk.apps import App

root_agent = Agent(
    name="basic_agent",
    model="gemini-2.5-flash",
    description="A greeting agent.",
    instruction="""
    You are a helpful assistant that greets the user.
    Ask for the user's name and greet them by name.
    """,
)

# bypass adk run error when folder name is not a valid python identifier
app = App(
    name="basic_app",
    root_agent=root_agent
)
