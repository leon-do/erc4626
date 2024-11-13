# ERC-4626

- Alice deposits() 10 tokens to the vault
- Bob deposits() 10 tokens to the vault
- Protocol transfers() 10 tokens to the vault (yield)
- Alice can now withdraw() 15 tokens from the vault
- Bob can now withdraw() 15 tokens from the vault

## Usage

### Deploy

0x2F0eA3326979A025ef6F0A59F05523f319e88411

```shell
export TOKEN_ADDRESS=0x2D5ee574e710219a521449679A4A7f2B43f046ad

forge script script/Deploy.s.sol:Deploy \
--rpc-url https://ethereum-sepolia-rpc.publicnode.com \
--private-key 0x62794f078924d349d893f1fcd5e60abb74892649aa1d11bcea70f94351f46305 \
--broadcast
```

### Verify

```shell
export ETHERSCAN_API_KEY=KQQ46P3VJZ4MCC7TVS8HZ43MZQNFAGFX6Y
export VAULT_ADDRESS=0x3660D35487fe08bCBC0BB1Af6e7C011346A094cD

forge verify-contract $VAULT_ADDRESS \
--watch src/Vault.sol:Vault \
--constructor-args $TOKEN_ADDRESS \
--verifier-url https://eth-sepolia.blockscout.com/api
```

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
