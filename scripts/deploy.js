const { ethers } = require("hardhat");

async function main() {
  const Journal = await ethers.getContractFactory("OnChainJournal");
  const journal = await Journal.deploy();

  await journal.waitForDeployment();

  console.log("Contract deployed to:", await journal.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
