from fastapi.security.api_key import APIKeyHeader, APIKey
from fastapi import Security, HTTPException
from os import getenv

key_header = APIKeyHeader(name="X-Api-Key", auto_error=True)


def check_api_key(header_key: str = Security(key_header)):
    if header_key != getenv("MZN_API_KEY"):
        raise HTTPException(status_code=403, detail="Invalid API key")
