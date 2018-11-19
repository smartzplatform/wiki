# Dividend Token. Constructor description

!!! warning
    When using constructors and DApps interfaces (like Smartz) with light wallet software (like Metamask, Trust wallet, Status) you should always be sure what account you are currently using and which network is currently selected in your wallet software. All interactions with any smart contract are always made using settings in your wallet. All DApps only display information from blockchain and help your browser and wallet software to build correct transactions to smart contracts in blockchains. Also, remember that all smart contracts capable networks now are a very young type of software presented as beta versions. So be careful and give your feedback to development teams. Your user experience is extremely important for decentralized software evolution.

## Contract description

Smartz Dividend token is an ERC-20 compatible token contract, where token balances represent stakeholders' shares in some DAO. Total supply of token counts as 100%.

The contract allows to receive payments in ETH and distribute them between dividend token holders according to their relative token balances (share amounts). It's a simple and useful instrument to organize incoming payments for DAO members. It can also be used to fix DAO member shares a redistribute them with simple token transfers.

For example, Alice, Bob, and Eva have 500, 200 and 300 tokens in contract with the total supply of tokens 1000. Then, Alice, Bob, and Eva have 50%, 20%, and 30% respectively. Then, incoming payment of 100 ETH will be distributed as dividends to Alice, Bob, and Eva as 50, 20, and 30 ETH respectively.

Every incoming payment is distributed accordingly to token distribution at the moment of payment event, and, in case of minting (emission) of new tokens, all shares of all participants will be diluted, and next payment will be distributed accordingly. For example, continuing previous case, if Alice mint 1000 tokens on her address, then Alice, Bob, and Eva now have 1500, 200, and 300 tokens respectively with a total amount of 2000 tokens. Now shares are distributed as 75%, 10%, and 15% respectively. And next payment of 100 ETH will be distributed as 75, 10, and 15 ETH.

The contract can be used:

* for payments distribution between multiple persons;
* to organize funds and store them for different purposes;
* to automatically pay taxes (simply giving a needed percentage of tokens to tax's office);
* many other financial tasks.

The token itself can be used in any ERC-20 compatible software as any other usual token, allowing transfers or spend allowances for tokens. Also, constructor allows making token mintable (allowing emission of additional tokens), pausable (allowing to pause token circulation between participants).

## Configuring contract for a dividend token

On Smartz.io platform, in the [Dividend token](https://smartz.io/deploy/76d7922f2007c8930ffae747/0) page, you need to specify the same parameters as for usual тoken contracts:

* **DApp name**: the name of your DApp. It will be displayed in your Smartz.io dashboard;
* **Name of a dividend token**: the name of your dividend token;
* **Token Symbol**: the token symbol (will be displayed in Etherscan and wallets);
* **Decimals**: the number of decimal places (decimal precision of token amounts (like "cents" in one token), f.e. USD has precision 2, ETH has precision 18);
* **"Can token owner mint new tokens?"**: the ability to additionally issue tokens. Creator of a contract can create new tokens if this option is on. In dividend token it's useful to add new stakeholders, easy rebalancing shares;
* **Max tokens count**: the maximum number of tokens. works only with enabled minting ability, doesn't allow to mint tokens above this limit;
* **Premint tokens**: the number of tokens on contract's owner balance. If no miniting enabled, all tokens in the system go to the balance of contract owner;
* **Is token pausable?**: the ability to suspend token functions. When paused, nobody can transfer, allow others to transfer or mint new tokens. The shares are "frozen", but Dividend token contract will continue to accept and distribute incoming payments.


## Configuring DApp for a dividend token

After entering the required data, you will receive the configured contract code in the text field. You can analyze it, but if you really need to do it, a better way is to find contract code on GitHub with test cases, history of development and comments. This code was created using parameters, provided on the previous step and will be compiled and sent to the blockchain.

Now, with checkbox "Restrict public access to the contract UI" you need to decide, do you want to allow other people have access to your DApp? The DApp is simply an URL (a constant webpage) on Smartz.io website, you can just send it to other users or even download to your personal computer [feature in develpment]. You cannot deny users to send transactions to your Smartz contract, but Smartz can restrict access to an easy and useful interface, keeping it closed for any visitor instead of you. In most cases, you don't need a private access to the DApp, because you want to share this DApp with other participants. This DApp can be considered as a "wallet" for your dividend token because it allows operating with different functions of dividend token.

When you press "Deploy now", your smart-contract will be placed in a future transaction with all parameters and a wallet software will be "invited" to sign the contract creation transaction. You will see a popup window in Metamask, or another warning from you wallet software: signing the transaction and sending it to blockchain is the most important and secure part of any wallet software, so you will not miss it.

## Smart contract deployment for a dividend token

When you confirm transaction in your wallet software, it's sent to miners, and you need to wait until transaction will be included in one of the next blocks. After that, you receive the address of deployed contract and link to DApp on Smartz as "Manage your contract" link. You can check the success of contract creation on Etherscan, using transaction hash or contract address.

Also, when Smartz receives info about the deployed contract, it saves DApp to your dashboard, allowing to access it via your dashboard or directly with URL (for anybody, if you're provided public access to it). This interface allows to interact with smart contract and create transactions to use all its functionality.

You can view your DApp in [My dashboard](https://smartz.io/dashboard) page with the name you configured on the first step, or by link "Manage your contract" you've received after contract deployment.

## Interface of deployed contract for dividend token

### Info values

On DApp page the following information about the created contract is available. Some fields are optional, depending on the configuration of dividend token:

* **Total supply** (`totalSupply`): the total number of existing tokens;
* **Token ticker** (`symbol`): the abbreviated name of the token used in wallets;
* **Decimal places** (`decimals`): the number of decimal digits in the decimal part of the token;
* **Maximum tokens** (`cap`): the maximum possible number of tokens when minting allowed;
* **Minting finished** (`mintingFinished`): is token minting allowed;
* **Paused** (`paused`): the token transfer status (can be transferred or paused);
* **Owner** (`owner`): the address of contract creator, owner, having access to "the only owner" allowed functions, like minting;
* **Token name** (`name`): the name of the token;
* **Total amount of dividends** (`m_totalDividends`): the total amount of dividends to be distributed. Sum of all payments, that was not claimed by stakeholders;
* **Total amount of hanging dividends** (`m_totalHangingDividends`): the total amount of dividends not distributed because of failed payment to the stakeholder (if Ether is sent to contract);

## Contract functions

!!! warning
    When using functions of contracts always be sure which account and network you are using in your wallet software. You can easily own the same address in several Ethereum networks, sending your transactions to mainnet instead of testnet.

### View functions

These functions only ask different kinds of information from the contract and don't store any data on the blockchain. These functions don't require transaction signing, they simply get an answer from a smart contract.

* **Get balance** (`balanceOf`): find out the token balance at any address. Standard function for any ERC-20 compatible wallets;
* **View allowance** (`allowance`): view the number of tokens that the address of owner has allowed to spend from another address (spender). Standard function for any ERC-20 token;
* **Get emission info** (`m_emissions`): (internal) view the information for given ID of token emission event. Needed if you want to inspect particular emission of tokens in detail;
* **Get last token emission id for address** (`m_lastAccountEmission`): (internal) get ID of last token emission for given address.

### Write Functions

To change the states and values of a smart contract, you need to use write functions that enter new information to the blockchain. All these functions consume some amount of gas:

* **Deposit** (`transfer`): main contract function accepting payments, that will be distributed between participants according to their shares, presented as token balances. Note: the contract can accept direct payments to its address, but some wallets software restricts the amount of gas, sent with payments, so better way is to call this function from Smartz.io DApp, or tune up gas limit for sending ether to dividend token contract;
* **Transfer tokens** (`transfer`): transfers some of your tokens to a different address. This is a standard function for any ERC-20 compatible token;
* **Mint new tokens** (`mint`): mints new tokens. Available only to the owner, this function creates a new token on given address. All shares, represented by token balances will be diluted by new emission proportionally resulting token balances. Function is available only to the owner of DApp;
* **Finish minting** (`finishMinting`): disables further emission of the token forever. This action cannot be undone. Any further emissions of a token will be impossible. The function is available only to the owner of DApp;
* **Approve spending** (`approve`): allows the specified address to spend the specified number of tokens. Standard function for ERC-20 compatible tokens;
* **Increase approval** (`increaseApproval`): increases the number of tokens that can be spent by the specified address. Standard function for ERC-20 compatible tokens;
* **Decrease approval** (`decreaseApproval`): reduces the number of tokens that can be spent by the specified address. Standard function for ERC-20 compatible tokens;
* **Transfer from** (`transferFrom`): transfers tokens from one account to another, if correctly approved. Standard function for ERC-20 compatible tokens;
* **Pause circulation** (`pause`): disables any token transfers of emissions. This option is available only if you configured "pausable" when creating a contract. The function is available only to the owner of DApp;
* **Enable circulation** (`unpause`): unpauses token transfers and minting if paused. This option is available only if you configured "pausable" when creating a contract. The function is available only to the owner of DApp;
* **Transfer ownership** (`transferOwnership`): transfers token ownership to another address. Warning: this is the most critical security function of a contract. After transferring ownership of a contract to another address, the previous owner loses the ability to call "only owner" functions.
