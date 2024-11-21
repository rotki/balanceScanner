import boa
import pytest

YABIR_ETH = '0xc37b40ABdB939635068d3c5f13E7faF686F03B65'
LUKI_ETH = '0x1b33a20eC0b319Ba17F5f0bC4A80EFFbc38d4F81'


def test_query_token_balances(balance_scanner):
    """Test that querying eth balances works fine"""
    balances = balance_scanner.tokens_balance(
        YABIR_ETH,  # owner
        [
            '0x9ae380f0272e2162340a5bb646c354271c0f5cfc',  # CNC
            '0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84',  # stETH
        ]
    )
    print(balances)
    assert balances == [11699828777706702072, 1]


def test_eth_balances(balance_scanner):
    """Test that querying eth balances works fine"""
    yabir_balance = 26321422000908732
    luki_balance = 3785539300302345056
    with boa.env.anchor():
        boa.env.set_balance(YABIR_ETH, 26321422000908732)
        boa.env.set_balance(LUKI_ETH, luki_balance)
        balances = balance_scanner.ether_balances([YABIR_ETH, LUKI_ETH])
        assert balances == [yabir_balance, luki_balance]


