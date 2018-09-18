# How to deploy an Invoice smart contract

An Invoice smart contract is designed to automate the process of issuing and tracking payment of invoices.

For example, a buyer orders some goods in an online store and wants to pay for it upon receipt. The seller agrees, but with the condition that in case of a refusal, only delivery will be paid. A smart contract receives from the buyer a certain amount (the cost of sending the goods) and sends it to the seller, if the invoice has not been paid in full.

With the help of this contract, one can also provide additional security to the buyer when shopping online. The buyer sends a part of the money to the contract. If he/she does not settle the account by a certain date (the parcel is lost or the goods are of insufficient quality), the funds are returned back to his wallet.

Issue invoices to your customers using this flexible and convenient smart contract. It can be used to conduct a transaction or to receive funds from a variety of clients. In the Invoice contract, you set the due dates for the action and also specify the addresses of the wallets to which the funds are distributed under different algorithms of the transaction participants' behaviour.

## Details for creating a contract

Log in to your MetaMask wallet. Then log in to the Smartz.io platform and go to the [Invoice](https://smartz.io/deploy/8907c7a43ee39ec8d4d6bb26/) constructor where you can specify the following smart contract parameters:

* **Dapp name**: the name of the smart contract that will be used in Smartz interface;
* **Invoice Amount**: invoice amount;
* **Beneficiary address**: address of the beneficiary (recipient);
* **Short message**: account purpose;
* **Payer address**: address of the payer (not necessary to specify);
* **Valid Until**: the validity period of the account (not necessary to specify);
* **Partial Receiver**: if the validity period is specified, but before its completion the account was paid only partially, you can choose the recipient of incomplete funds — the beneficiary (by default) or the payer;
* **Auto send on paid**: uncheck the box if you do not want to automatically send money to the beneficiary after paying the invoice.

After providing the necessary information, you will see the contract code. 

You can also restrict public access to the contract interface by ticking **Restrict public access to the contract UI**. 

After deployment, you can view the deployed contract at [Etherscan](https://etherscan.io/) or go to the [Dashboard](https://smartz.io/dashboard) to manage the contract.

## Information about the contract

This is information about the states and values in the contract, which is available in the Dashboard. 

* **Short message**: account purpose specified during deployment.
* **Invoice Amount**: invoice amount.
* **Current Paid Amount**: paid at the moment. 
* **Status**: the status of the contract (active, i.e. in the initial state, expired or paid).
* **Balance**: the amount of Ether currently accumulated in the contract.
* **Beneficiary**: the address to which the money will be sent after the invoice is paid.
* **Partial Receiver**: the address to which the money will be sent from the account after the expiration date, if funds are only partially collected, and not the entire amount.

## Write functions 

To change the states and values of a smart contract, use the write functions that add new information to the blockchain. All these functions consume a certain amount of gas.

* **Pay**: pay the invoice.
* **Withdraw**: withdraw the balance from the account (if the entire amount was not collected) and transfer to the specified address.
