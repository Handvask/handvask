from os import getenv

from fastapi import HTTPException, Security
from fastapi.security.api_key import APIKeyHeader

key_header = APIKeyHeader(name="X-Api-Key", auto_error=True)


def check_api_key(header_key: str = Security(key_header)):
    """Check that the API key is present, raise exception if not

    Args:
        header_key (str, optional): Defaults to Security(key_header).

    Raises:
        HTTPException: Invalid API Key
    """
    if header_key != getenv("MZN_API_KEY"):
        raise HTTPException(status_code=403, detail="Invalid API key")
