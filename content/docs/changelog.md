<!-- TITLE: Changelog -->
<!-- SUBTITLE: Full list of changes and new features -->

## 0.13.0
* A brand new design of smart contract management page.
* Added Bet Me smart contract constructor.

## 0.12.0
* Completely open source of the platform code.
* Added Merkle Airdrop smart contract constructor.

## 0.11.0
* Added verification info for Etherscan in every management page of deployed smart contract.
* Added tutorial about how to verify smart contract in Etherscan after deployment.
* Displaying the number of deployments at the main page.

## 0.10.0
* Technical WP was released.
* ERC721 token constructor is added.
* EOS is now supported, login is available via Scatter extension (tutorial is available in our wiki).
* EOS Simple Token constructor is added.
* Optimisation of the platform.

## 0.9.0
* Authorization via Ethereum singnature (via MetaMask or Trust wallet). Now you don’t need to go through the registration process. You just need to unlock your Ethereum account and sign one transaction in the Ethereum blockchain.
* Trust Wallet support. Now you can working with smart contracts on the Smartz platform using a mobile app.
* Brand new design of the main page, improvements of the deployment pages and dashboard.
* Custom contract development feature. We can develop or customize any smart contract, or just provide a UI for managing your custom contract. If this follows the trend of Smartz Platform, we can do this pro bono.
* Online chat feature in the lower right corner of web page. You can ask any questions about the platform in this window.

## 0.8.0
* New smart contract constructor: Crowdfunding for ERC20 token. Easily raise Ether funds for your startup in exchange for your ERC20 tokens! Just share the contract instance link to your potential contributors.
* Added freeze function to the Multisignature Wallet constructor.
* Now third-party developers can open public access to the dashboard of deployed contracts (not even verified).
* Access to the contract dashboard is now available without authorization.
* Widgets, input field: added option to define the algorithm in `stringHash`, avaliable `keccak256` (by default) or `sha256`.
* If the contract has a fallback function that receive Ether, then there is a button for sending Ether to the contract in the dashboard section with write functions. Text and description of this field can be customized by specifying in the function specification.
* Added ability to specify the amount of sent Ether when calling payable functions. Text and description of this field can be customized as well as fallback function.

## 0.7.0
* Moved platform to smartz.io domain.
* New pictures of smart contracts constructors.
* Smartz token constructor: added data widget (in the Preminted frozen tokens section), gas limit increased to 4400000.
* Added errors output.
* If the deployment form is not filled correctly, the fields are not cleared.
* My Contracts section shows only contracts from the current network (selected in Metamask).
* Added constructor Smartz platform features for demonstrating all features of the platform.
* Ledger constructor: added hint when searching by hash file and string.
* Booking constructor: added “Canceled” status, changed order of the fields.
* Added widgets for input fields when calling contract functions (file hash, string, date/time).

## 0.6.1
* Added smart contract constructors: Booking and Ledger.
* New widgets avaliable in the smart contract dashboard for developers: `ethCount`, `unixtime`, `enum`.
* New widgets avaliable in the deployment page for developers: `fileHash`, `stringHash`.
* Smart contract constructors versioning (version 1 — removed dependency from `make_generic_function_spec`, `merge_function_titles2specs`).

## 0.5.6
* Added english documentation in the Docs section.
* Added Privacy policy and Terms & conditions documents.
* Added Smartz token constructor. It’s ERC20-compatible token with additional features: freezing tokens, burning tokens, approveAndCall function. Used as Smartz platform token.
* Added Atomic Swap constructor: two participants can swap tokens for ether or tokens with this simple smart contract.
* Added Multitoken constructor: in this smart contract you can create a variety of non-standard tokens.

## 0.5.0
* Added the ability to upload and test smart contracts for developers.
* Added a section with documentation describing the process of smart contract launching, as well as help pages with a description of ready smart contracts from the Smartz team.
* Added a documentation page with description of the developing process and uploading your own smart contract.
* Fixed bug with authorization and many others.
* Published the examples of smart contract constructors.

## 0.4.1
* Contracts deploy and management UI specifications are written and operated using JSON Schemas.
* Added “name” field for every contract instance.
* Added “network” field for every contract instance which holds information on which network your instance is deployed, e.g. Mainnet, Rinkeby etc.
* Added deploy price in ETH for contracts.
* After successful contract deployment users get Etherscan and instance management links.
* Added dashboard page which lists all user contracts with key states and values of smart contracts.
* Added instance management page with UI for calling all instance read and write functions, their titles and descriptions.

## 0.3
* Payment feature for deployment smart contracts.
* Building docker images for deploying in Travis CI.
* Added ERC20 Token constructor.

## 0.2
* Added Simple ICO constructor.
* Added Multisignature Wallet constructor.

## 0.1
* First version developed during the hackathon.
