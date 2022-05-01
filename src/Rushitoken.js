import React,{useState,useEffect} from "react";
import {ethers} from "ethers"
import Rushitoken from "./Rushitoken.json"
function Rushitokens(){
    let[account,setaccount]=useState([])
    async function connect(){
        if(window.ethereum){
        const connect=await window.ethereum.request({
          method:"eth_requestAccounts"
        })
        setaccount(connect)
}
}
let[contract,setcontract]=useState(null)
const contractaddress="0x666e8e12704114fE9d2732eB430Df9794490e417"
async function contracts(){
  const provider=new ethers.providers.Web3Provider(window.ethereum);
  const signer=provider.getSigner()
  const contract=new ethers.Contract(contractaddress,Rushitoken,signer)
setcontract(contract)

}
let[name,setname]=useState(null)
let[symbol,setsymbol]=useState(null)

let[balnce,setbalance]=useState(null)

async function data(){
  const name=await contract.name()
  const symbol=await contract.symbol()
  const balance=await contract.balanceOf(account[0])
  const balanceacc=await balance.toNumber()
  const decimals=await  contract.decimals()
  const accountbalance=balanceacc/Math.pow(10,decimals)
 
  
setname(name)
setsymbol(symbol)
setbalance(accountbalance)
}
useEffect(()=>{
  data();
},[contract])
let[input,setinput]=useState()
let[input1,setinput1]=useState()
 async  function transfer(){
 const input=document.getElementById("input")
 const input2=document.getElementById("input2")
 setinput(input.value)
 setinput1(input2.value)
    contract.transfer(input.value,input2.value) 
    setinput("")
    setinput1("")
}



    return(<>
    
    <button onClick={connect}></button>
    <h1>{account}</h1>

<button onClick={contracts}></button>
<h1>{name}</h1>
<h1>{symbol}</h1>

<h1>{balnce}</h1>

<input placeholder="addresss" id="input" value={input}></input>
<input placeholder="value" id="input2" value={input1}></input>
<button onClick={transfer}></button>
    </>)
}

export default Rushitokens

