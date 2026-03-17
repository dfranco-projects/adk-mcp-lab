from pydantic_settings import BaseSettings, SettingsConfigDict

class Config(BaseSettings):
    """Configuration for ADK MCP Lab."""

    # GCP
    project_id: str

    # Notion
    notion_api_key: str

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

config = Config()
