// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract vending{

 address payable public seller;
 address payable public buyers;
 uint public price;
 enum state{created,sell,locked,relese,inactive}
 state public states;
constructor(){
states==state.created;
}

function sell()payable public {
  require(states==state.created);
  price=msg.value/2;
  seller=payable(msg.sender);
  states=state.sell;
}
modifier cheack() {
  require(msg.value==price*2);
  require(states==state.sell);
  _;
}
modifier recive() {
  require(states==state.locked);
  require(msg.sender==buyers);
  _;
}
modifier dealdone() {
  require(states==state.relese);
  require(msg.sender==seller);
  _;
}
function buy()payable public cheack(){
  buyers=payable(msg.sender);
  states=state.locked;
}
function recived()payable public recive(){
  states=state.relese;
  buyers.transfer(price);
}


function withdrawl()payable public dealdone(){
  states=state.inactive;
  seller.transfer(price*3);
  price=0;
    states=state.created;
}

function cancle()payable public  {
  require(states==state.sell);
  require(msg.sender==seller);
  states=state.inactive;
  seller.transfer(address(this).balance);
  price=0;
  states=state.created;
}
function show()public view returns(uint){
    return(address(this).balance);
}

}




