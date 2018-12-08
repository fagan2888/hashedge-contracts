pragma solidity ^0.4.24;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardBurnableToken.sol";

contract HashRateOptionsToken is DetailedERC20, StandardBurnableToken {
  string public hashType;
  string public currencyType;
  string public hashRateUnit;
  uint256 public tokenSize;
  uint256 public startTs;
  uint256 public endTs;
  uint256 public strikePrice;

  constructor(string _name, string _symbol, uint8 _decimals, uint256 _totalSupply) public DetailedERC20(_name, _symbol, _decimals) {
    totalSupply_ = _totalSupply * 10 ** uint256(_decimals);
  }

  function setInfo(
    string _hashType, string _currencyType, string _hashRateUnit, uint256 _tokenSize,
    uint256 _startTs, uint256 _endTs, uint256 _strikePrice)
  external {
    require(_endTs > 0);
    require(endTs == 0);

    hashType = _hashType;
    currencyType = _currencyType;
    hashRateUnit = _hashRateUnit;
    tokenSize = _tokenSize;
    startTs = _startTs;
    endTs = _endTs;
    strikePrice = _strikePrice;
  }

  // TODO: how to exercise
}