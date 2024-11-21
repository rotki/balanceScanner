#pragma version >=0.4.0

"""
@title BalanceScanner
@license MIT
@author rotki (info@rotki.com), yabirgb (yabirg@proton.me)

@notice Robust utility for querying token and Ether balances across multiple addresses
@dev Evolved from MyCryptoHQ's eth-scan contract with key improvements:
- Handles balance queries for complex tokens like stETH
- Mitigates edge cases from previous implementation
- Returns 0 instead of failing for unquerable balances

@dev Original implementation: 
https://github.com/MyCryptoHQ/eth-scan/blob/master/contracts/BalanceScanner.sol
"""

MAX_NUM_TOKENS: constant(uint32) = 1000

@view
@external
def ether_balances(addresses: DynArray[address, MAX_NUM_TOKENS]) -> DynArray[uint256, MAX_NUM_TOKENS]:
    """
    @notice Query eth balances for the array of addresses provided
    @param addresses The addresses that will be queried
    """
    results: DynArray[uint256, MAX_NUM_TOKENS] = []
    for addr:address in addresses:
        results.append(addr.balance)

    return results

@view
@external
def tokens_balance(owner: address, tokens: DynArray[address, MAX_NUM_TOKENS]) -> DynArray[uint256, MAX_NUM_TOKENS]:
    """
    @notice Get balances of a single owner across multiple token contracts
    @param owner Address of the token holder
    @param tokens List of ERC-20 token contract addresses
    @return Array of token balances for the owner across specified tokens
    """
    results: DynArray[uint256, MAX_NUM_TOKENS] = []

    is_success: bool = False
    response: Bytes[32] = b""
    for token: address in tokens:
        is_success, response = raw_call(
            token,
            abi_encode(owner, method_id=method_id("balanceOf(address)")),
            max_outsize=32,
            revert_on_failure=False,
            is_static_call=True,
        )
        if is_success == False:
            results.append(0)
        else:
            results.append(convert(response, uint256))

    return results

@view
@external
def token_balances(owners: DynArray[address, MAX_NUM_TOKENS], token: address) -> DynArray[uint256, MAX_NUM_TOKENS]:
    """
    @notice Get ERC-20 token balances for multiple addresses
    @param owners List of addresses to query token balances for
    @param token Address of the ERC-20 token contract
    @return Array of token balances corresponding to the input addresses
    """
    results: DynArray[uint256, MAX_NUM_TOKENS] = []

    is_success: bool = False
    response: Bytes[32] = b""
    for owner: address in owners:
        is_success, response = raw_call(
            token,
            abi_encode(owner, method_id=method_id("balanceOf(address)")),
            max_outsize=32,
            revert_on_failure=False,
            is_static_call=True,
        )
        if is_success == False:
            results.append(0)
        else:
            results.append(convert(response, uint256))

    return results
