// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

// Console.sol can be imported to handle logging in the test environment
import "truffle/Console.sol";

contract TestMetaCoin {
  function testInitialBalanceUsingDeployedContract() public {
    // the log method can be used to print string literals
    Console.log("testing initial balance of the deployed contract");

    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testMintingCoins() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    address receiversAddress = address(0x1234567890123456789012345678901234567890);

    // the log method also accepts a label with a variable
    Console.log("mint 500 coins at ", receiversAddress);
  
    meta.mintCoins(receiversAddress, 500);

    uint expected = 500;

    Assert.equal(meta.getBalance(receiversAddress), expected, "the receiver should have 500 coins");
  }

  function testTransferringCoins() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    address sendersAddress = address(0x0987654321098765432109876543210987654321);

    meta.mintCoins(sendersAddress, 500);
    Console.log("the sender's balance is", meta.getBalance(sendersAddress));
    Console.log("mint 500 coins at", sendersAddress);

    address receiversAddress = address(0x1987654321198765432119876543211987654321);

    Console.log("5 ether worth of coins to", receiversAddress);
  
    meta.transferCoins(sendersAddress, receiversAddress, 5);

    uint expected = 20;

    Assert.equal(meta.getBalance(receiversAddress), expected, "the receiver should have 20 coins");
  }
}
