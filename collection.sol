// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.10;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

// import "@openzeppelin/contracts/access/Ownable.sol";

contract collection is ERC721Upgradeable {
    uint256 private tokenID;
    string private url;
    uint256 private maxQuantity;
    uint16 private edition;
    uint128 private COST;

    function initialize(
        string memory name_,
        string memory symbol_,
        string memory assetUrl,
        uint256 maxQuantity_,
        uint16 edition_,
        uint128 cost_
    )
        public
        // uint16 royalty
        initializer
    {
        __ERC721_init(name_, symbol_);
        tokenID = 0;
        url = assetUrl;
        maxQuantity = maxQuantity_;
        edition = edition_;
        COST = cost_;
    }

    function mint() public payable {
        require(tokenID < maxQuantity, "Max quantity reached");
        require(msg.value == COST, "Not Enough gas.");
        tokenID += 1;
        _safeMint(msg.sender, tokenID);
    }

    function tokenURI() public view returns (string memory) {
        return url;
    }

    function getEdition() public view returns (uint16) {
        return edition;
    }
}
