// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        Vault vault =
            new Vault(IERC20(vm.envAddress("TOKEN_ADDRESS")), vm.envString("VAULT_NAME"), vm.envString("VAULT_SYMBOL"));
        console.log("Vault deployed to:", address(vault));

        vm.stopBroadcast();
    }
}
