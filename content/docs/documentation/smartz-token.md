# How to Deploy a Smartz Token -->

A token that supports the ERC20 standard and provides the following additional functions: freezing tokens, destroying tokens, approveAndCall (this function saves the user from having to perform two transactions instead of one with decentralized payments). This is the basic token of the Smartz platform.

## Data for Creating a Smart Contract

Go to Smartz.io and specify the following information in the [Smartz token](https://platform.smartz.io/deploy/5abd2628882820000c1ebf56/0) section:

* **Instance name** – the name of the smart contract;
* **Signatures quorum** – the number of signatures required to complete transactions;
* **Addresses of owners** – addresses of the token holders;
* **Name of a token** – the token name;
* **Token Symbol** – the token symbol;
* **Decimals** – the number of decimals after the decimal point;
* **Tokens for creator** – the number of tokens for the contract creator;
* **“Is token burnable?” (it can be ticked)** – you can specify whether holders may burn their tokens;
* **“Add approveAndCall function?” (it can be ticked)** – this feature allows the holder to use tokens to pay for another contract and immediately perform the desired actions using the called contract;
* **Preminted frozen tokens** – this feature allows the holders to receive the specified number of tokens immediately after the creation of the token; however, such tokens will be frozen (this field can be left blank, or you can specify an unlimited number of users who will receive the premint tokens);
    1. Address of token holder – the token holder’s address;
    2. Amount of tokens – the number of tokens;
    3. Date and time of unfreezing – the date and time for unfreezing (after that tokens will be available for transfers and other use cases).

After specifying the required data, you will receive a contract code. The contract will be deployed for 0.3 ETH (using the MetaMask wallet).

You can also provide public access to your contract by ticking the Allow public access to the contract UI checkbox.

Deployed contracts will be available on [Etherscan](https://etherscan.io/) or under [My contracts](https://platform.smartz.io/dashboard).

## Contract details 

The following information about the contract that you have created will be available to you:

* contract address on Etherscan;
* **Token name** – the token name;
* **Total supply** – the total number of existing tokens;
* **Decimal places** – the number of decimals after the decimal point;
* **Number of owners** – the number of owners added to the smart contract;
* **“Am I owner?”** – this feature checks whether the current address is one of the owners of the wallet;
* **Quorum requirement** – the number of signatures required to perform any action in relation to this wallet;
* **Token ticker** – the abbreviated name of the token;
* **Owners** – this feature provides a list of the current wallet owners.

### View functions

You can use the View functions to obtain information on the status of the contract and details related to any address or other conditions that you should specify. These functions do not make any changes in the blockchain:

* `availableBalanceOf` allows you to see the owner’s available balance; 
* **Check owner** (`isOwner`) is used to check whether the specified account is one of the wallet owners;
* **Get balance** (`balanceOf`) is used to check the balance of tokens for any address;
* `m_sales` determines whether the address has the privilege of issuing frozen tokens;
* **“Is operation confirmed?”** (`hasConfirmed`) allows you to check whether the operation has been confirmed by the owner;
* **Get n-th owner** (`getOwner`) allows you to get the specified n-th owner;
* **View allowance** (`allowance`) is used to view the number of tokens that can be spent by another address in accordance with the permission of the specified token owner;

### Write functions

Write functions are used to change states and values in the smart contract (these functions introduce new information into the blockchain). Each of the following functions consumes some gas: 

* **Approve spending** (`approve`) is used to allow the specified address to spend the specified number of your tokens;
* `setSale` allows you to grant or revoke the privileged status of the specified address;
* **Remove owner** (`removeOwner`) is used to delete the specified owner;
* **Transfer from** (`transferFrom`) allows you to transfer tokens between accounts;
* **Burn tokens** (`burn`) is used to destroy the specified number of tokens belonging to the current account;
* `frozenTransfer` is used to issue frozen tokens (this option is available only for addresses with the sale status);
* **Decrease approval** (`decreaseApproval`) allows you to reduce the number of your tokens that can be spent by the specified address;
* **Add owner** (`addOwner`) is used to add a new owner;
* **Transfer tokens** (`transfer`) allows you to send the specified number of your tokens to another address;
* **Revoke confirmation** (`revoke`) allows you to cancel a confirmed operation of the current owner.
* **Change quorum requirement** (`changeRequirement`) is used to change the number of signatures required to perform any action in relation to this wallet (withdraw money, change owners, etc.);
* `setKYCProvider` is the address of the contract with the IKYCProvider interface which is optionally used as one of the criteria for unfreezing tokens;
* **Increase approval** (`increaseApproval`) allows you to increase the number of your tokens that can be spent by the specified address;
* `frozenTransferFrom` is used to revoke frozen tokens (this option is available only for addresses with the sale status);
* **Change owner** (`changeOwner`) allows you to change the address of an existing owner;
* `disablePrivileged` is used to permanently disable all privileged functions (freezing, etc.), after which the token becomes automatic, and the owners do not have any privileges.
