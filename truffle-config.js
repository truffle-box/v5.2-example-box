const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "add your mnemonic here";
const providerURL = "add your provider url here";

module.exports = {
  networks: {
    // to use ethPM v3 you need to have a configuration to connect to Ropsten
    ropsten: {
      provider: () => new HDWalletProvider({
        mnemonic,
        providerOrUrl
      }),
      network_id: "3"
    }
  },

  // the following configuration enables the use of ethPM v3
  ethpm: {
    ipfsHost: "ipfs.infura.io",
    ipfsProtocol: "https",
    ipfsPort: "5001",
    registry: {
      address: "libraries.ethpm.eth",
      network: "ropsten",
    },
    version: "3"
  },
  // ens must be enabled for ethPM v3
  ens: {
    enabled: true
  }
}
