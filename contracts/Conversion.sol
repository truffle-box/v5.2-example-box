// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

contract Conversion {
  uint public conversionRate = 4;

  function convertEthValueToNumberTokens(uint amountEther) public returns (uint convertedAmount) {
    return amountEther * conversionRate;
  }
}
