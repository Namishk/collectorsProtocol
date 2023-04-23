// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.10;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./collection.sol";

contract NFTFactory {
    event CollectionCreated(address creator, address indexed contractAddress);

    address implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function createNftCollection(
        string memory _name,
        string memory _symbol,
        string memory assetUrl,
        uint256 maxQuantity_,
        uint16 edition_,
        uint128 cost_
    ) public returns (address) {
        address clone = Clones.clone(implementation);
        emit CollectionCreated(msg.sender, address(clone));
        collection(address(clone)).initialize(
            _name,
            _symbol,
            assetUrl,
            maxQuantity_,
            edition_,
            cost_
        );
        return address(clone);
    }
}
