# rotki balance scanner

Utility contract to query ether balance and token balances.
This contract is based on [https://github.com/MyCryptoHQ/eth-scan/tree/master](https://github.com/MyCryptoHQ/eth-scan/tree/master) but:

- Mitigates [edge cases](https://github.com/MyCryptoHQ/eth-scan/issues/260) from previous implementation
- Returns 0 instead of failing for unquerable balances. Doesn't return a result tuple.

It is deployed at `0x54eCF3f6f61F63fdFE7c27Ee8A86e54899600C92` in:

|Chain|ID|transaction|block height|
|-----|--|-----------|------------|
Ethereum|1|[0x75c684a085bcb85e8dd1bbe29704c02c95e5a75b11d34e1788204e25b13f1312](https://etherscan.io/tx/0x75c684a085bcb85e8dd1bbe29704c02c95e5a75b11d34e1788204e25b13f1312)|21244360|
Optimism|10|[0xbf2825a6673f1f0df433a22691982fcfcd21c3818d203636b9884796ce32a3ba](https://optimistic.etherscan.io/address/0xbf2825a6673f1f0df433a22691982fcfcd21c3818d203636b9884796ce32a3ba)|128347331|
Scroll|534352|[0x2dd0d38f410388e7e92154b38bf7dbfb173a7f2f5f8c1088fbd11e30dd0ac006](https://scrollscan.com/tx/0x2dd0d38f410388e7e92154b38bf7dbfb173a7f2f5f8c1088fbd11e30dd0ac006)|11313627|
Arbitrum|42161|[0xda0fada142b4cf069ef7006f0ce8696899d058e23df4a9f150f401796ade4843](https://arbiscan.io/tx/0xda0fada142b4cf069ef7006f0ce8696899d058e23df4a9f150f401796ade4843)|277181663|
Base|8453|[0x779fd70a64ed8aacbaf214fd7a73770296414bb3509a2e9747106c671ea9802d](https://basescan.org/tx/0x779fd70a64ed8aacbaf214fd7a73770296414bb3509a2e9747106c671ea9802d)|22742887|
Polygon|137|[0x10d4f0f2c35a5018f4834c685c320188f13da663a31ac06c6e3e25ac7b0e9744](https://polygonscan.com/tx/0x10d4f0f2c35a5018f4834c685c320188f13da663a31ac06c6e3e25ac7b0e9744)|64601591|
Gnosis|100|[0x5d5a3514b3ce4372ad375b559683e11af61aa21598a9fb8e8c688f5c25ca63de](https://gnosisscan.io/tx/0x5d5a3514b3ce4372ad375b559683e11af61aa21598a9fb8e8c688f5c25ca63de)|37150152|
Kaia|8217|[0x321817496a4f078ddc2597582b329a7d41c77d54acfadfa9ac35b212adb137ea](https://kaiascan.io/tx/0x321817496a4f078ddc2597582b329a7d41c77d54acfadfa9ac35b212adb137ea)|171040511|
Kaia Testnet|1001|[0x79cfccfd5bd0872f630cd01ebce1637c2903687f92c54a98e4c1f3d05db5b166](https://kairos.kaiascan.io/tx/0x79cfccfd5bd0872f630cd01ebce1637c2903687f92c54a98e4c1f3d05db5b166?tabId=overview&page=1)|171474021|
Fantom|250|[0xeba338fdd7367abf44142d7861542d49530fe6f7d174d3a98755696ab284b5fe](https://ftmscan.com/tx/0xeba338fdd7367abf44142d7861542d49530fe6f7d174d3a98755696ab284b5fe)|98834844|
Avax|43114|[0xa8ca284510410ecb7541f498772a832b15e812f1f4b0f49abd5095a43bc3c520](https://snowtrace.io/tx/0xa8ca284510410ecb7541f498772a832b15e812f1f4b0f49abd5095a43bc3c520?chainid=43114)|53867944|
Binance|56|[0x8614c437a86d343d782785630cca6a91cc317e305fdf2a8c2b160eb9cdf0bc1a](https://bscscan.com/tx/0x8614c437a86d343d782785630cca6a91cc317e305fdf2a8c2b160eb9cdf0bc1a)|45468013|
