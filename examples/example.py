"""Octopus theme test — Python
Representative of the AI/data/general-purpose world Octopus's theme wasn't
built around. Exercises: decorator, type hints, f-strings, dataclasses,
async/await, comprehensions, comment.doc (docstrings), exception handling.
"""

from __future__ import annotations

import asyncio
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Optional


class DeploymentStatus(Enum):
    PENDING = "pending"
    SUCCEEDED = "succeeded"
    FAILED = "failed"


@dataclass
class Release:
    """A single release moving through a deployment pipeline."""

    version: str
    environment: str
    status: DeploymentStatus = DeploymentStatus.PENDING
    deployed_at: Optional[datetime] = None
    tags: list[str] = field(default_factory=list)

    @property
    def is_healthy(self) -> bool:
        return self.status is DeploymentStatus.SUCCEEDED

    def __repr__(self) -> str:
        return f"Release({self.version!r} -> {self.environment}, {self.status.value})"


class RetryExhaustedError(Exception):
    """Raised when all retry attempts have been exhausted."""


async def deploy_with_retry(release: Release, max_attempts: int = 3) -> bool:
    for attempt in range(1, max_attempts + 1):
        try:
            print(f"Attempt {attempt}/{max_attempts}: deploying {release.version}")
            await asyncio.sleep(0.1 * attempt)
            release.status = DeploymentStatus.SUCCEEDED
            release.deployed_at = datetime.utcnow()
            return True
        except ConnectionError as err:
            print(f"  transient failure: {err}")
            if attempt == max_attempts:
                raise RetryExhaustedError(f"gave up after {max_attempts} attempts") from err
            await asyncio.sleep(2**attempt)
    return False


def recent_releases(releases: list[Release], *, within: timedelta) -> list[Release]:
    cutoff = datetime.utcnow() - within
    return [r for r in releases if r.deployed_at and r.deployed_at > cutoff]


def summarize(releases: list[Release]) -> dict[str, int]:
    return {
        status.value: sum(1 for r in releases if r.status is status)
        for status in DeploymentStatus
    }


if __name__ == "__main__":
    releases = [
        Release(version="2.4.1", environment="production"),
        Release(version="2.4.2", environment="staging"),
    ]
    asyncio.run(deploy_with_retry(releases[0]))
    print(summarize(releases))
