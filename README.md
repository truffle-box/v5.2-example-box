README for v5.2-example-box

The purpose of this box is to highlight some of the features included with Truffle version 5.2.0.

There are 4 main features highlighted in this box:

1. Logging to the console in Solidity tests - simply import "truffle/Console.sol" in your test. Then, in your functions you will be able to call the `log` function on `Console`. If you wish to simply log a hard-coded string or some other value, pass it as an argument to `Console.log`. If you would like to have a label for a value to log, then include the label as the first argument with the value second. You can find several examples of this in `test/TestMetaCoin.sol`.

2. Support for ethPM v3 - to use ethPM v3, there is a little bit of configuration you will need to perform (see `truffle-config.js`), and then you should be good to go. Check out www.ethpm.com for more information or see Nick Gheorghita's blogpost for Truffle at <insertURLHere> for more information about how to get started.

3. Solidity creation from ABI - you can now import a contract/library from a JSON file which contains only the ABI. Take your ABI and save it in your `contracts` directory, you may use the file extension `abi.json` or `json`. Truffle will then generate an artifact file for you during compilation. You can then import it into your Solidity files (or use `artifacts.require` in your JavaScript) to use. See an example in the `contracts` folder.

4. Experimental support for compiling with multiple versions of the Solidity compiler - **PLEASE NOTE THIS FEATURE IS EXPERIMENTAL** Up to this point, Truffle has required that a project compile with only a single version of the Solidity compiler. A new, experimental feature has been added which will analyze each source and its imports' pragmas. It will take each source and its imports, and then group them by Solidity compiler version and perform a compilation. To use this, set the Solidity compiler version to "pragma" (see `truffle-config.js`).
