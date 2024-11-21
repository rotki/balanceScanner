from src import BalanceScanner
from moccasin.boa_tools import VyperContract
# from boa.contracts.vyper.vyper_contract import VyperContract

def deploy() -> VyperContract:
    return BalanceScanner.deploy()

def moccasin_main() -> VyperContract:
    return deploy()
