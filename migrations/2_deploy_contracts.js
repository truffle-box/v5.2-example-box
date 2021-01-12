const MetaCoin = artifacts.require("MetaCoin");
const Conversion = artifacts.require("Conversion");

module.exports = async (deployer, networks, accounts) => {
  await deployer.deploy(Conversion);
  const conversion = await Conversion.deployed();

  await deployer.deploy(MetaCoin, conversion.address);
  const metaCoin = await MetaCoin.deployed();
};
