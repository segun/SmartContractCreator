/// SPDX-License-Identifier: MIT-0
pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

library AssetModelV2 {
    struct AssetRequest {
        uint256 tokenId;
        string description;
        string symbol;
        uint256 totalSupply;
        uint256 issuingPrice;
        address issuer;
    }

    struct TokenShares {
        uint256 tokenId;
        address owner;
        address sharesContract;
        string description;
        string symbol;
        uint256 totalSupply;
        uint256 issuingPrice;
        address issuer;
    }

    function validateAsset(AssetRequest memory asset) public pure {
        bytes memory b = bytes(asset.description);
        bytes memory b1 = bytes(asset.symbol);
        require(b.length > 0, 'asset description can not be empty');
        require(b1.length > 0, 'assset symbol can not be empty');
        require(asset.tokenId > 0, 'token id must be greater than 0');
        require(asset.totalSupply > 0, 'total supply must be greater than 0');
        require(asset.issuer != address(0), 'asset issuer address does not exist');
    }
}
