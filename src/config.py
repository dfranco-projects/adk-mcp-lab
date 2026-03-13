from pydantic_settings import BaseSettings, SettingsConfigDict

class Config(BaseSettings):
    """Configuration for ADK MCP Lab."""

    project_id: str

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

config = Config()
