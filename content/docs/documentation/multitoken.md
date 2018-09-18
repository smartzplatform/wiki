# How to deploy a Multitoken

With this smart contract, you can create tokens that are not related to the ERC20 standard, as well as perform various operations on tokens that exist only within this smart contract. The solution allows customers to quickly receive tokens from you or other persons to any specified address.

By using tokens in such a contract, you can easily tokenize any objects of the real world, identify and transfer ownership of them.

## Data for Creating a Smart Contract

At the [Smartz.io](https://platform.smartz.io/) platform, in the [Multitoken](https://platform.smartz.io/deploy/5ac50d5a34d83a000d115518) section, you need to specify:

* **Instance Name**: The name of the smart contract;
* **Decimals**: the number of decimal places;
* **Tokens for creator**: The number of tokens for the contract creator;
* **Mask for subtokens ID**: The mask for subtokens ID is essentially a number that limits the total number of different tokens that can be created in the smart contract.

By entering the required data, you will receive the contract code.

You can also choose to open public access to the smart contract control panel by ticking Allow public access to the contract UI.

After deploying, you will be able to view the deployed contract at [Etherscan](https://etherscan.io/) or go to contract management in the [My contracts](https://platform.smartz.io/dashboard) section.

## Detailed information on the contract 

The following information about the created contract is available:

* **Mask**: the mask for subtoken ID;
* **Decimals**: the number of decimal places;
* **Owner**: the owner's address.

## View functions

You can use view functions to obtain information about the contract’s status and the values associated with any address or other conditions that you need to specify. These functions don't make any changes to the blockchain.

**View allowance** (`allowance`): view the number of tokens that the token holder has allowed for another address to spend:

* **Token ID**: token identifier;
* **Address of owner**: the address of the token holder that can transfer tokens;
* **Address of spender**: the address of the spender that is allowed to spend the received tokens.

**Get balance** (`balanceOf`): find out the balance of tokens of any address:

* **Token ID**: token identifier;
* **Address**: the address of the token holder.

**Total supply** (`totalSupply`): the total amount of token offers:

* **Token ID**: token identifier;

## Write functions

To change the states and values of a smart contract, you need to use the write functions that put new information in the blockchain. All these functions consume some amount of gas. 

**Create new subtoken** (`createNewSubtoken`): create a new subtoken and send it to the specified address:

* **Token ID**: token identifier;
* **Address of owner**: the address that receives subtokens;
* **Tokens count**: the number of tokens to create.

**Transfer from** (`transferFrom`): transfer tokens from one account to another:

* **Token ID**: token identifier;
* **From**: move tokens from this account;
* **To**: transfer tokens to this account;
* **Amount**: the number of tokens.

**Approve spending** (`approve`): allow the specified address to spend a number of your tokens:

* **Token ID**: token identifier;
* **Address**: the address that is allowed to spend tokens;
* **Amount**: the number of tokens.

**Transfer ownership** (`transferOwnership`): transfer the ownership of the token to another address (required for some administrative operations):

* **Address**: the address that will receive the ownership.

**Transfer tokens** (`transfer`): transfer a number of your tokens to another address:

* **Token ID**: token identifier;
* **To**: the address of the recipient;
* **Amount**: the number of tokens.
