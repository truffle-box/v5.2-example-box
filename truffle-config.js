const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "add your mnemonic here";
const providerOrUrl = "add your provider url here";

module.exports = {
  compilers: {
    solc: {
      version: "0.7.6",
      // version: "pragma"
    }
  },

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
      address: "0x0bd0200357D26A0bB5d1D1c1Fd56C317B68d15d5",
      network: "ropsten",
    },
    version: "3"
  },

  // ens must be enabled for ethPM v3
  ens: {
    enabled: true
  }
}
