//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract Kgfnft is  ERC721,Ownable{
    uint public mintprice;
    uint public totalsupply;
    uint public maxsupply;
    uint public maxperwallet;
    bool public ispublicmintenabled;
    string internal baseTokenurl;
    address payable public withdrawallet;
    mapping(address=>uint)public walletmints;

    constructor() payable ERC721("KGFNFT" ,"KGF") {
mintprice=0.02 ether;
totalsupply=0;
maxsupply=1000;
maxperwallet=3;
    }
    function setmintenable(bool _ispublicmintenabled)external  onlyOwner{
ispublicmintenabled=_ispublicmintenabled;
    }
    function setbaseTokenurl(string calldata _basetokenurl)external onlyOwner{
        baseTokenurl=_basetokenurl;
    }
    function tokenURI(uint tokenID_)public view override returns(string memory){
        require(_exists(tokenID_), 'token does ot exits');
        return string(abi.encodePacked(baseTokenurl,Strings.toString(tokenID_),'.json'));
    }
    function withdraw()external onlyOwner{
        (bool success,)=withdrawallet.call{value:address(this).balance}('');
        require(success,'withdraw failed');
    }
function mint(uint quantity_)public payable{
    require(msg.value==quantity_* mintprice);
    require(ispublicmintenabled,'miniting not enable');
    require(totalsupply+quantity_<=maxsupply,'sold out');
    require(walletmints[msg.sender]+quantity_<=maxperwallet,'exceed wallets limit');
    walletmints[msg.sender]+=quantity_;
for(uint i=0;i<quantity_;i++){
    uint newTokenID=totalsupply+i;
    totalsupply++;
    _safeMint(msg.sender,newTokenID);
}


}
}

