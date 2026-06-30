import hardhatEthers from "@nomicfoundation/hardhat-ethers";
import "dotenv/config";

export default {
  solidity: {
    version: "0.8.24",
  },
  plugins: [hardhatEthers],
};
