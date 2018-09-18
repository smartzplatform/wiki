# How to deploy a multisignature wallet

A wallet with the multisignature function significantly improves security. Before transaction is confirmed by the network, it must be signed with N signatures out of M (M is greater or equal to N).

For example, a wallet can take funds and store them but will not let you withdraw funds until it receives at least 2 confirmations out of 3. This is very convenient because if any of the participants/owners are hacked, it won't lead to unauthorized withdrawal of funds.

A multisignature wallet can handle arbitrary N and M, but the lowest possible option of 2 out of 3 covers a huge number of business tasks where involvement of a third party is required.

Use case: a family fund that consists of the husband and wife and a third-party trustee (a friend or a grandmother). The fund stores ether, but to withdraw funds, the first person (for example, the husband) creates a withdrawal request, and the second or the third participant (the wife or the grandmother) confirms the withdrawal. In this case, if someone is hacked, the funds will remain intact and they can be withdrawn to another, secure address.

## Data for Creating a Smart Contract

On Smartz.io platform, in the [Multisignature wallet](https://platform.smartz.io/deploy/5aaa7aa2ab3d71000bd0c69f) page, you need to specify:

* **Instance name**: the name of the smart contract;
* **Signatures quorum**: the quorum of signatures required to withdraw funds or change signatures;
* **Addresses of owners**: addresses (signatures) of the owners of the created wallet.

After entering the required data, you will receive the contract code. At this point, you can specify one owner of the wallet and add other owners later.

The contract will be deployed for 0.05 ether (through the MetaMask wallet).

After network deployment, you can view the deployed contract at Etherscan or manage the contract in the [My contracts](https://platform.smartz.io/deploy/5aaa7aa2ab3d71000bd0c69f) page.

## Detailed Information on the Contract

The following information about the created contract is available:

* **Number of owners**: the number of owners;
* **"Am I owner?"**: checks whether the current account is one of the owners of the wallet;
* **Quorum requirement**: the number of signatures required to perform actions on this wallet;
* **Owners**: returns the list of all current wallet owners.

## View Functions

You can use the View functions to obtain information on the status of the contract and the values associated with any address or other conditions that you need to specify. These functions don't make any changes to the blockchain:

* **Check owner**: checks whether the specified account is one of the wallet owners;
* **"Is operation confirmed?"**: checks whether the operation is validated by the owner;
* **Get n-th owner**: gets the owner number from 0 and above.

## Write Functions

To change the states and values of a smart contract, you need to use Write functions that enter new information to the blockchain. All these functions consume some amount of gas.

In addition, all the functions that change the owners and are related to the withdrawal of funds are available strictly to the contract owners:

* **Remove owner**: removes the specified owner;
* **Add owner**: adds a new owner. Available only to the contract owner;
* **Revoke confirmation**: cancels the operation confirmation of the current owner (current account);
* **Change quorum requirement**: sets a new number of signatures required to perform actions in this wallet (withdrawal, change of owners, etc.);
* **Send Ether**: sends a certain amount of ether from the wallet to the destination address. The amount needs to be specified in the smallest units: wei;
* **Change owner**: changes the address of the current owner from one to another.
