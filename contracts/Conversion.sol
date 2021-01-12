// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Conversion {
  uint public conversionRate = 4;

  function convertEthValueToNumberTokens(uint amountEther) public view returns (uint convertedAmount) {
    return amountEther * conversionRate;
  }
}
