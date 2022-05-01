require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");

const dotenv=require("dotenv")

 dotenv.config()

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
  solidity: "0.8.4",
  networks:{
    rinkeby:{
      url:process.env.REACT_APP_RINKEBY_RPC_URL,
      accounts:[process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: {
      rinkeby: process.env.REACT_APP_ETHERSCAN_APIKEY,
    },
  }
 
};