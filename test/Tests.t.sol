// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";
import {Vault} from "../src/Vault.sol";

contract Tests is Test {
    Token public token;
    Vault public vault;

    function setUp() public {
        // EOA owner deploys token
        vm.startPrank(address(1));
        token = new Token();
        vault = new Vault(token);
    }

    function test_TokenName() public view {
        assertEq(token.name(), "Token");
        assertEq(token.symbol(), "TKN");
        assertEq(token.balanceOf(address(1)), 100 * 10 ** 18);
    }

    function test_VaultName() public view {
        assertEq(vault.name(), "Vault Token");
        assertEq(vault.symbol(), "vTKN");
        assertEq(vault.balanceOf(address(1)), 0);
    }

    function test_Deposit() public {
        // approve 100
        token.approve(address(vault), 100 * 10 ** 18);
        // deposit 75
        vault.deposit(75 * 10 ** 18, address(1));
        assertEq(vault.balanceOf(address(1)), 75 * 10 ** 18);
        assertEq(token.balanceOf(address(1)), 25 * 10 ** 18);
    }

    function test_DepositAndWithdraw() public {
        token.approve(address(vault), 100 * 10 ** 18);
        vault.deposit(75 * 10 ** 18, address(1));
        assertEq(vault.balanceOf(address(1)), 75 * 10 ** 18);
        assertEq(token.balanceOf(address(1)), 25 * 10 ** 18);
        // get max
        uint256 maxWithdraw = vault.maxWithdraw(address(1));
        assertEq(maxWithdraw, 75 * 10 ** 18);
        // Redeem has a third argument, “owner” which allows msg.sender to burn the shares of the “owner” while sending assets to the “receiver” (second argument) if they have allowance to do so.
        vault.redeem(maxWithdraw, address(1), address(1));
        assertEq(vault.balanceOf(address(1)), 0 * 10 ** 18);
        assertEq(token.balanceOf(address(1)), 100 * 10 ** 18);
    }

    function test_Yield() public {
        // alice and bob deposit
        token.approve(address(vault), 100 * 10 ** 18);
        vault.deposit(10 * 10 ** 18, address(111));
        vault.deposit(10 * 10 ** 18, address(222));

        // yield in vault
        token.transfer(address(vault), 10 * 10 ** 18);
        assertEq(vault.totalAssets(), 30 * 10 ** 18);

        // alice and bob withdraw more than they deposited
        assertEq(vault.maxWithdraw(address(111)), 15 * 10 ** 18 - 1);
        assertEq(vault.maxWithdraw(address(222)), 15 * 10 ** 18 - 1);
    }
}
