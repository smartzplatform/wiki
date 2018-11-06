# Dividend Token. Constructor description

#### Common warnings
When using constructors and DApps interfaces(like Smartz) with light wallet software(like Metamask, Trust wallet, Status) you should always be sure what account you are currently using and which network is currently selected in your wallet software. All interactions with any smart-contract are always made using settings in your wallet, All DApps only display information from blockchain and help your browser and wallet software to build correct transactions to smart-contracts in blockchains. Also, remember, that all smart-contracts capable networks now are very young type of software, presented as beta-versions, so be careful and please, give your feedback to any of development teams - your user experience is extremely important for decentralized software evolution.


### Contract description

Smartz Dividend token is a ERC-20 compatible token contract, where token balances represent stakeholders' shares in some DAO. Total supply of token counts as 100%.

Contract allows to receive payments in ETH and distribute them between dividend token holders according to their relative token balances (share amounts). It's simple and useful instrument to organise incoming payments for DAO members. It can also be used to fix DAO member shares an redistribute them with simple token transfers.

For example, Alice, Bob and Eva have 500,200 and 300 tokens in contract with total supply of tokens 1000. Then, Alice, Bob and Eva have 50%, 20% and 30% respectively. Then, incoming payment of 100 ETH will be distributed as dividends to Alice, Bob and Eva as 50, 20 and 30 ETH respectively.                                                                        

Every incoming payment is distributed accordingly to token distribution at the moment of payment event, and, in case of minting (emission) of new tokens, all shares of all participants will be diluted, and next payment will be distributed accordingly.                                                                                                               
For example, continuing previous case, if Alice mint +1000 tokens on her address, then Alice, Bob and Eva now have 1500, 200 and 300 tokens respectively with total amount of 2000 tokens. Now shares are distributed as 75%, 10% and 15% respectively, and next payment of 100ETH will be distributed as 75, 10 and 15 ETH.

Contract can be used for payments distribution between multiple persons, to organize funds and store them for different purposes, to automatically pay taxes (simply giving needed percentage of tokens to tax's office) and many other financial tasks.

The token itself can be used in any ERC-20 compatible software as any other usual token, allowing trasfers or spend allowances for tokens. Also constructor allows to make token mintable (allowing emission of additional tokens), pausable (allowing to pause token circualtion between participants).


## Confuguring contract for dividend token


On Smartz.io platform, in the [Dividend token](https://smartz.io/deploy/76d7922f2007c8930ffae747/0) page, you need to specify the same parameters as for usual тoken contracts:

* **DApp name**: the name of your DApp. It will be displayed in your Smartz.io dashboard;
* **Name of a dividend token**: The name of your dividend token;
* **Token Symbol**: the token symbol (will be displayed in Etherscan and wallets);
* **Decimals**: the number of decimal places (decimal precision of token amounts (like "cents" in one token), f.e. USD has precision=2, ETH has precision=18);
* **"Can token owner mint new tokens?"**: the ability to additionally issue tokens. Creator of contract can create new tokens if this option is on. In dividend token it's useful to add new stakeholders, easy rebalancing shares;
* **Max tokens count**: the maximum number of tokens. works only with enabled minting ability, doesn't allow to mint tokens above this limit;
* **Premint tokens**: the number of tokens on contract's owner balance. If no miniting enabled, all tokens in system go to balance of contract owner;
* **Is token pausable?**: the ability to suspend token functions. When paused, nobody can transfer, allow others to transfer or mint new tokens. The shares are "frosen", but Dividend token contract will continue accept and distribute incoming payments.


## Confuguring DApp for dividend token

After entering the required data, you will receive the configured contract code in text field. You can study it, but if you really need to do it, better way is to find contract code on github with test cases, history of development and comments. This code was constructed using parameters, provided on previous step and will be compiled and sent to blockcahin.

Now, with checkbox "Restrict public access to the contract UI" you need to decide, do you want to allow other people have access to your DApp?. The DApp is simply an URL (a constant webpage) on Smartz.io website, you can simply send it to other users or even download to your personal computer[feature in develpment]. You cannot deny users to send transactions to your smartz contract, but Smartz can restrict access to easy and useful interface, keeping it closed for any visitor instead of you. In most cases you don't need a private access to the DApp, because want to share this DApp with other participants. This DApp can be considered as a "wallet" for your dividend token, because it allows to operate with different functions of dividend token.

Then, when you press "Deploy now", your smart-contract will be placed in future transaction with all parameters and wallet software will be "invited" to sign contract creation transaction. You will see a popup window in Metamask, or other warning from you wallet software: signing the transaction and sending it to blockcahin is the most important and secure part of any wallet software, so you will not miss it.

## Deployment of smart-contract for dividend token

When you confirm transaction in you wallet software, it's sent to miners, and you need to wait some time, until transaction will be included in one of next blocks. After that you receive the address of deployed contract and link to DApp on Smartz as "manage your contract" link. You can check success of contract creation on Etherscan, using transaction hash or contract address.

Also, when Smartz receives info about deployed contract, it saves DApp to your dashboard, allowing to access it via your dashboard or directly with URL (for anybody, if you're provided public access to it). This interface allows to interact with smart-contract and construct transactions to use all its functionality.

You can view your DApp in [My dashboard](https://platform.smartz.io/dashboard) page with name, you configured on first step, or by link "manage your contract" you've received after contract deployment.


## Interface of deployed contract for dividend token

#### Info values

On DApp page the following information about the created contract is available. Some fields are optional, depending of configuration of dividend token:

* **Total supply** (`totalSupply`): the total number of existing tokens;
* **Token ticker** (`symbol`): the abbreviated name of the token used in wallets
* **Decimal places** (`decimals`): the number of decimal numbers in the decimal part of the token;
* **Maximum tokens** (`cap`): the maximum possible number of tokens when minting allowed;
* **Minting finished** (`mintingFinished`): is token minting allowed or no;
* **Paused** (`paused`): the token transfer status (can be transferred or paused);
* **Owner** (`owner`): the address of contract creator, owner, having access to "only owner" allowed functions, like minting;
* **Token name** (`name`): the name of the token;
* **Total amount of dividends** (`m_totalDividends`): total amount of dividends to be distributed. Sum of all payments, that was not claimed by stakeholders;
* **Total amount of hanging dividends** (`m_totalHangingDividends`): total amount of dividends not distributed because of failed payment to stakeholder (if ether is sent to contract);


## Contract functions

#### Common warnings

When using functions of contracts always be sure which account and network you are using in your wallet software. You can easily own the same address in serveral Ethereum networks, sending your transactions to mainnet instead of testnet.

## View functions

These function only ask different kinds of information from contract and don't store any data on blockchain. These function don't require transaction signing, they simply get an answer from smart-contract.

* **Get balance** (`balanceOf`): find out the token balance at any address.Standard for any ERC-20 compatible wallets;

* **View allowance** (`allowance`): view the number of tokens that the address of owner has allowed to spend from another address(spender). Standard function fro any ERC-20 token;

* **Get emission info** (`m_emissions`): (internal) View the information for given ID of token emission event. needed if you want to inspect particular emission of tokens in detail;

* **Get last token emission id for address** (`m_lastAccountEmission`): (internal) Get ID of last token emision for given address;


## Write Functions

To change the states and values of a smart contract, you need to use Write functions that enter new information to the blockchain. All these functions consume some amount of gas:


* **Deposit** (`transfer`): Main contract function accepting payments, that will be distributed between participants according to their shares, presented as token balances. Note: contract can accept direct payments to its address, but some wallets software restricts amount of gaz, sent with payments, so better is to call this function from Smartz.io DApp, or tune up gaz limit for sending ether to dividend token contract;

* **Transfer tokens** (`transfer`): transfers some of your tokens to a different address. This is a standard function for any ERC-20 compatible token;

* **Mint new tokens** (`mint`): mints new tokens. Available only to owner, this function creates new token on given address. All shares, represented by token balances will be diluted by new emission proportionally resulting token balances. Function is available only to owner of DApp;

* **Finish minting** (`finishMinting`): Disables further emission of the token forever. This action cannot be undone. Any further emissions of token will be impossible. Function is available only to owner of DApp;

* **Approve spending** (`approve`): allows the specified address to spend the specified number of tokens. Standard function for ERC-20 compatible tokens;

* **Increase approval** (`increaseApproval`): increases the number of tokens that can be spent by the specified address.  Standard function for ERC-20 compatible tokens;

* **Decrease approval** (`decreaseApproval`): reduces the number of tokens that can be spent by the specified address. Standard function for ERC-20 compatible tokens;

* **Transfer from** (`transferFrom`): transfers tokens from one account to another, if correctly approved. Standard function for ERC-20 compatible tokens;

* **Pause circulation** (`pause`): Disables any token transfers of emissions. This option is available only if you configured "pausable" when creating contract. Function is available only to owner of DApp;

* **Enable circulation** (`unpause`): Unpauses token transfers and minting if paused. This option is available only if you configured "pausable" when creating contract. Function is available only to owner of DApp;

* **Transfer ownership** (`transferOwnership`): transfers token ownership to another address. Warning - this is the most critical security function of contract. After transfering ownership of contract to another address, previous owner looses ability to call "only owner" functions.
