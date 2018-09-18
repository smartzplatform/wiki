# How to deploy an ERC-721 token

The ERC-721 standart first gained popularity through the CryptoKitties game, which for a while was the most resource-intensive Ethereum network app.

CryptoKitties are built on the ERC-721 token, which makes it possible to use unique, i.e. non-fungible, tokens in smart contracts. ERC-721 made CryptoKitties unique: players can grow and trade virtual pets, each of which is one-of-a-kind.

ERC-721 tokens are used in any exchange process, but their value is the result of uniqueness and rarity: each token of this kind has its own attributes, which makes it non-fungible. This means that tokens can have a different cost relative to each other.

Unlike ERC-20, ERC-721 tokens can only be traded in whole: you cannot transfer or sell half of a digital asset (for example, you cannot transfer half a digital kitty).

In this standard, a token belongs only to a physical address — an account represented as a user's wallet or another smart contract.

Another difference from ERC-20 is the availability of new functions for smart contracts. Since each token is unique, it is necessary to record the ownership of a particular token in the block and track its movements. For this purpose, several new functions have become available in the standard (see the Functions section for more details).

ERC-721 is best suited for digitizing different unique assets with different cost and properties: real estate, intellectual property, works of art, collectibles, etc.

## Information for setting up a smart contract

Log in to your MetaMask wallet. Then log in to the Smartz.io platform and go to the section [ERC721 token](https://smartz.io/deploy/f8df8d0f873c1d21b4302483/0), where you will be asked to specify the following settings for the smart contract:

*	**Contract instance name**: the name of the smart contract that will be used in the Smartz interface;
*	**Name of a token**: token name
*	**Token Symbol**: a short symbol for the token
*	**Is mintable**: option (tick) – whether the token owner can issue new tokens or not;
*	**Max tokens count**: the maximum number of tokens created in the contract;
*	**Is token burnable?**: option (tick) – whether the owner can burn their tokens;
*	**Is token pausable?**: option (tick) – whether the owner can suspend the token's functionality.

After providing the necessary information, you will receive the contract code.  

The contract is deployed through the MetaMask wallet.

You can also restrict public access to the contract interface by ticking **Restrict public access to the contract UI**.

After deployment, you can view the deployed contract at [Etherscan](https://etherscan.io/) or go to the [Dashboard](https://smartz.io/dashboard) to manage the contract.

## View functions

These functions provide information about a contract status and value. 

*	**Minting finished**: if true, no more tokens can be created.
*	**Token name**: denotes the name of the token.
*	**Total supply**: the current total of all tokens.
*	**Paused**: if true, all token transfers are disabled.
*	**Owner**: address of the token owner in Etherscan.
*	**Token ticker**: abbreviated name of the token.

## Query functions

Use the query functions to obtain information about the contract status. They allow you to search the account book. The availability of these functions depends on the fields selected during deployment: you can search by each of the selected fields, and also by the record ID. These functions do not make any changes to the blockchain.

*	**Get Approved** (`getApproved`): this function shows the approved address for the token ID, or zero if the address is not specified.
*	**Token Of Owner By Index** (`tokenOfOwnerByIndex`): shows the token ID for the specified token index of the requested owner.
*	**Exists** (`exists`): checks if a certain token exists.
*	**Token By Index** (`tokenByIndex`): receives a token ID for the index of all tokens in this contract.
*	**Get owner** (`ownerOf`): shows the owner of a specific token.
*	**Get balance** (`balanceOf`): shows the number of tokens belonging to the specified address.
*	**Token URI** (`tokenURI`): shows the universal resource identifier (URI) for the given token.
*	**Is Approved For All** (`isApprovedForAll`): states whether the owner has approved the operator.

## Write functions

To change the states and values of a smart contract, use the write functions that add new information to the blockchain system. All these functions consume a certain amount of fuel. 

*	**Approve spending** (`approve`): allows the specified address to use a specific token.
*	**Set Token URI** (`setTokenURI`): sets the string URI/name for the given token.
*	**Transfer from** (`transferFrom`): transfers tokens from one account to another. 
*	**Enable circulation** (`unpause`): enables the transfer of tokens (if token circulation was previously suspended).
*	**Mint new tokens** (`mint`): creates new tokens "out of thin air" and assigns an address to them. 
*	**Save Transfer from** (`safeTransferFrom`): safely transfers ownership of this token to another address. If the target address is a contract, it must use the onERC721Received method.
*	**Burn tokens** (`burn`): burns a certain number of tokens belonging to the current account.
*	**Finish minting** (`finishMinting`): disables the creation of new tokens.
*	**Pause circulation** (`pause`): disables any token transfer and burn operations. 
*	**Set Approval For All** (`setApprovalForAll`): sets or cancels the approval of this operator. An operator must be specified that will be allowed to transfer all tokens from the sender on its behalf.
*	**Save Transfer from** (`safeTransferFrom`): safely transfers ownership of the token to another address. Here you can set data bytes to send together with secure transfer checking.
*	**Transfer ownership** (`transferOwnership`): transfers ownership of the token to another address. This right is necessary to perform some administrative operations.
