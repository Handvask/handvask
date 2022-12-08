from os import getenv

from fastapi import HTTPException, Security
from fastapi.security.api_key import APIKey, APIKeyHeader

key_header = APIKeyHeader(name="X-Api-Key", auto_error=True)


def check_api_key(header_key: str = Security(key_header)):
    if header_key != getenv("MZN_API_KEY"):
        raise HTTPException(status_code=403, detail="Invalid API key")
