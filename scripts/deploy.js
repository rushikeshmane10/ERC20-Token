
const hre = require("hardhat");

async function main() {
 
  const KGFNFT = await hre.ethers.getContractFactory("Kgfnft");
  const kgfnft = await KGFNFT.deploy();

  await kgfnft.deployed();

  console.log("Kgfnftaddress:", kgfnft.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
