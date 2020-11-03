const MetaCoin = artifacts.require("MetaCoin");
const Conversion = artifacts.require("Conversion");
// address of deployed conversion library contract on Ropsten
// this won't work on a different network
// const convertLibContractAddress = "0x5F6040CBE72aD68AB8795621e8bf51319aeBD97c";

module.exports = async (deployer, networks, accounts) => {
  await deployer.deploy(Conversion);
  const conversion = await Conversion.deployed();

  await deployer.deploy(MetaCoin, conversion.address);
  const metaCoin = await MetaCoin.deployed();

  // send 2 ether worth of coins to accounts[1];
  await metaCoin.transferCoins(accounts[0], accounts[1], 2);
  const numberOfCoinsTransferred = await metaCoin.getBalance(accounts[1]);
  console.log(`transferred ${numberOfCoinsTransferred} coins to ${accounts[1]}`);
};
