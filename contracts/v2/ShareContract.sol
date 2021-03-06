/// SPDX-License-Identifier: MIT-0
pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShareContract is ERC20 {
    
    uint256 private _issuingPrice;

    constructor (string memory name, string memory symbol, uint256 totalSupply, uint256 price,  address owner) ERC20(name, symbol) public {
        // constructor
        address assetManagerV2 = msg.sender;
        _mint(owner, totalSupply);
        _approve(owner, assetManagerV2, totalSupply);
        _issuingPrice = price;
    }

    function issuingPrice() public view returns (uint256) {
        return _issuingPrice;
    }

    function allow(address owner, uint256 amount) public {
        address assetManagerV2 = msg.sender; // spender
        uint256 currentBalance = allowance(owner, assetManagerV2);
        _approve(owner, assetManagerV2, amount.add(currentBalance));
    }

    function details(uint256 tokenId) public view returns (address, uint256, string memory, string memory, uint256, uint256) {
        return (address(this), tokenId, name(), symbol(), totalSupply(), issuingPrice());
    }
}
