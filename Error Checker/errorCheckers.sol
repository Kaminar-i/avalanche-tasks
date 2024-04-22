// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract ErrorCheckers {
   // My solidity code

   uint totalSupply;
   uint public itemId;

   struct Items{
    string name;
    uint remainingItems;
   }

   Items[] public items_;
   
   struct ItemOwners{
        address owner;
        uint itemsOwned;
   }

    ItemOwners[] public _owners;


   mapping(uint => Items) items;
   mapping (uint => ItemOwners) owners_;

   constructor() {
      totalSupply = 0;
   }

   function createItem(string memory name, uint amount) public {
    Items memory i_ = items[itemId];
    i_.name = name;
    i_.remainingItems = amount;
    items_.push(i_);
    totalSupply += amount;
    itemId++;
   }

   function buyItem(uint id, uint amount) public {
     if(id > itemId) revert( "Invalid item id");
     require(items_[id].remainingItems >= amount, "Not enough items");

     items_[id].remainingItems -= amount;
     totalSupply -= amount;

     ItemOwners memory o_ = owners_[id];
     o_.itemsOwned += amount;
     o_.owner = msg.sender;

     _owners.push(o_);
   }

   function checkSupply() public view{
    assert(totalSupply > 0);
   }

}