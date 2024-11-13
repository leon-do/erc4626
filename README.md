# ERC-4626

- Alice deposits() 10 tokens to the vault
- Bob deposits() 10 tokens to the vault
- Protocol transfers() 10 tokens to the vault (yield)
- Alice can now withdraw() 15 tokens from the vault
- Bob can now withdraw() 15 tokens from the vault

## Usage

### Deploy

```
0x2F0eA3326979A025ef6F0A59F05523f319e88411
```

```shell
export TOKEN_ADDRESS=0x2D5ee574e710219a521449679A4A7f2B43f046ad
export VAULT_NAME="Vault Token"
export VAULT_SYMBOL="vTKN"

forge script script/Deploy.s.sol:Deploy \
--rpc-url https://ethereum-sepolia-rpc.publicnode.com \
--private-key 0x62794f078924d349d893f1fcd5e60abb74892649aa1d11bcea70f94351f46305 \
--broadcast
```

### Verify

```shell
export ETHERSCAN_API_KEY=KQQ46P3VJZ4MCC7TVS8HZ43MZQNFAGFX6Y
export VAULT_ADDRESS=0x22ed0AD4e704608C7185bEA69e94c852da14747f

forge verify-contract $VAULT_ADDRESS \
--watch src/Vault.sol:Vault \
--verifier-url https://eth-sepolia.blockscout.com/api \
--constructor-args $TOKEN_ADDRESS
```

https://eth-sepolia.blockscout.com/address/0x22ed0AD4e704608C7185bEA69e94c852da14747f?tab=contract_code

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```
