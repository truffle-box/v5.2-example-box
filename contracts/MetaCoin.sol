// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./IConversion.abi.json";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
  event CoinsMinted(address indexed _address, uint256 _value);
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  mapping (address => uint) balances;
  IConversion conversionContract;

  constructor(address conversionContractAddress) {
    conversionContract = IConversion(conversionContractAddress);
    balances[tx.origin] = 10000;
  }

  function mintCoins(address receiver, uint amount) public returns (bool sufficient) {
    balances[receiver] += amount;
    emit CoinsMinted(receiver, amount);
    return true;
  }

  function transferCoins(address sender, address receiver, uint amountInEther) public returns (bool sufficient) {
    uint numberOfCoins = conversionContract.convertEthValueToNumberTokens(amountInEther);
    if (balances[sender] < numberOfCoins) return false;
    balances[sender] -= numberOfCoins;
    balances[receiver] += numberOfCoins;
    emit Transfer(msg.sender, receiver, numberOfCoins);
    return true;
  }

  function getBalance(address addr) public view returns (uint) {
    return balances[addr];
  }
}
