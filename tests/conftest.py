import pytest
from script.deploy import deploy

@pytest.fixture
def balance_scanner():
    return deploy()