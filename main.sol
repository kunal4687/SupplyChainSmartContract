// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract SupplyChain {
    
    enum ItemStatus { Created, InTransit, Delivered }
    
    struct Item {
        string name;
        string location;
        ItemStatus status;
    }
    
    mapping (address => mapping(uint => Item)) items;
    
    function createItem(address recipient, uint itemId, string memory name) public {
        items[recipient][itemId] = Item(name, "Producer", ItemStatus.Created);
    }
    
    function updateLocation(address recipient, uint itemId, string memory location) public {
        items[recipient][itemId].location = location;
    }
    
    function updateStatus(address recipient, uint itemId, ItemStatus status) public {
        items[recipient][itemId].status = status;
    }
    
    function getItem(address recipient, uint itemId) public view returns (string memory, string memory, ItemStatus) {
        Item memory item = items[recipient][itemId];
        return (item.name, item.location, item.status);
    }
    
}
