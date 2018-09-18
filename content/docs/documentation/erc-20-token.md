# How to Deploy a ERC20 Token

ERC20 is a token standard that has received broad support in the Ethereum blockchain for projects that launch ICO. The standard simplifies the compatibility of tokens with third-party services and on different platforms, as well as for various decentralized applications.

ERC20 describes the token functions that can be implemented in a smart contract and makes it easy to interact with other smart contracts in the blockchain. To handle ERC20 token transactions, you need to use gas purchased for ether.

## Data for Creating a Smart Contract

On Smartz.io platform, in the [ERC20 token](https://platform.smartz.io/deploy/5aaa7a85ab3d71000bd0c69d/0) page, you need to specify:

* **Instance name**: the name of the smart contract that will be displayed in the My contracts page;
* **Name of a token**: the name of the token;
* **Token Symbol**: the token symbol;
* **Decimals**: the number of decimal places;
* **"Can token owner mint new tokens?"**: the ability to additionally issue tokens;
* **Max tokens count**: the maximum number of tokens;
* **Premint tokens**: the number of tokens created before the main issue/ICO;
* **"Can token holders burn their tokens?"**: the ability to burn one's tokens;
* **"Token owner will be able to pause token functions"**: the ability to suspend token functions.

After entering the required data, you will receive the contract code.

The contract will be deployed for 0.1 ether (through the MetaMask wallet).

After network deployment, you can view the deployed contract at Etherscan or manage the contract in the [My contracts](https://platform.smartz.io/dashboard) page.

## Detailed Information on the Contract

The following information about the created contract is available:

* **Minting finished** (`mintingFinished`): the token issue (minting) status: completed or in progress;
* **Token name** (`name`): the name of the token;
* **Total supply** (`totalSupply`): the total number of existing tokens;
* **Decimal places** (`decimals`): the number of decimal numbers in the decimal part of the token;
* **Maximum tokens** (`cap`): the maximum possible number of tokens;
* **Paused** (`paused`): the token transfer status (can be transferred or paused);
* **Owner** (`owner`): the address of the token holder;
* **Token ticker** (`symbol`): the abbreviated name of the token used on the exchanges.

## View Functions

You can use the View functions to obtain information on the status of the contract and the values associated with any address or other conditions that you need to specify. These functions don't make any changes to the blockchain:

* **Get balance** (`balanceOf`): find out the token balance at any address;
* **View allowance** (`allowance`): view the number of tokens that the Address of owner has allowed to spend from another address (Address of spender).

## Write Functions

To change the states and values of a smart contract, you need to use Write functions that enter new information to the blockchain. All these functions consume some amount of gas:

* **Approve spending** (`approve`): allows the specified address to spend the specified number of tokens.
* **Transfer from** (`transferFrom`): transfers tokens from one account to another.
* **Enable circulation** (`unpause`): enables token transfer in case of suspension of transfers.
* **Mint new tokens** (`mint`): mints new tokens.
* **Burn tokens** (`burn`): destroys the specified number of tokens.
* **Decrease approval** (`decreaseApproval`): reduces the number of tokens that can be spent by the specified address.
* **Finish minting** (`finishMinting`): disables further issue of the token.
* **Pause circulation** (`pause`): disables any token transfers.
* **Transfer tokens** (`transfer`): transfers some of your tokens to a different address.
* **Increase approval** (`increaseApproval`): increases the number of tokens that can be spent by the specified address.
* **Transfer ownership** (`transferOwnership`): transfers token ownership to another address.
