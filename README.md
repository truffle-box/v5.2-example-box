README for v5.2-example-box

The purpose of this box is to highlight some of the features included with Truffle version 5.2.0.

1. Solidity creation from ABI - you can now import a contract/library from a JSON file which contains only the ABI. Take your ABI and save it in your `contracts` directory, you may use the file extension `abi.json` or `json`. Truffle will then generate an artifact file for you during compilation. You can then import it into your Solidity files (or use `artifacts.require` in your JavaScript) to use. See an example in the `contracts` folder.

2. Experimental support for compiling with multiple versions of the Solidity compiler - **PLEASE NOTE THIS FEATURE IS EXPERIMENTAL** Up to this point, Truffle has required that a project compile with only a single version of the Solidity compiler. A new, experimental feature has been added which will analyze each source and its imports' pragmas. It will take each source and its imports, and then group them by Solidity compiler version and perform a compilation. To use this, set the Solidity compiler version to "pragma" (see `truffle-config.js`).
