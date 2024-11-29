# rotki balance scanner

Utility contract to query ether balance and token balances.
This contract is based on [https://github.com/MyCryptoHQ/eth-scan/tree/master](https://github.com/MyCryptoHQ/eth-scan/tree/master) but:

- Mitigates [edge cases](https://github.com/MyCryptoHQ/eth-scan/issues/260) from previous implementation
- Returns 0 instead of failing for unquerable balances. Doesn't return a result tuple.

It is deployed at `0x54eCF3f6f61F63fdFE7c27Ee8A86e54899600C92` in:

- Ethereum
- Optimism
- Scroll
- Arbitrum
- Base
- Polygon
- Gnosis