# How to Deploy a Simple ICO

Simple ICO is a universal, simple, and reliable smart contract for ICO suitable for fundraising (or other ICO objectives) for companies of any orientation. 

The difficulty for most projects lies in the fact that the creation of a conventional smart contract for ICO is expensive and demands provision of high security (that said, contract code is rather complex), and at the same time, such a contract is difficult to correct after bugs are detected. 

Simple ICO undertakes all issues related to the creation and deployment of smart contract, whilst all keys are owned by the business, and the platform is a mediator. 

You receive ERC20 tokens with the possibility to choose their names, ticker, adjustable sale period and hard cap, as well as adjustable rate for which a set number of ERC20 tokens can be returned for ether.

## Data for smart contract creation

On the Smartz.io platform in [Simple ICO](https://platform.smartz.io/deploy/5aaa7a76ab3d71000bd0c69c/0) page, you need to identify:

* **Instance name**: smart contract name;
* **Name of a token**: name of a token;
* **Token Symbol**: symbol of a token;
* **“Is token burnable?” (marked with a check)**: you can mark whether owners can burn their tokens or not;
* **Start date**: date and time of the beginning of ICO;
* **End date**: date and time of the end of ICO;
* **Exchange rate**: token exchange rate per 1 ether;
* **Hard cap**: maximum level of token withdrawal (in ether);
* **Funds address**: address for withdrawing all funds.

After indicating all required data, you will receive the code of the contract. 

The deployment of a contract will be carried out for ETH 0.3 (via MetaMask wallet).

After deployment on the network, you will be able to look through the deployed contract on Etherscan or proceed to managing the contract in [My contracts](https://platform.smartz.io/dashboard) page.

## Detailed information on contract 

The following information on a created contract is available:

* **Rinkeby**: address of a contract on the Rinkeby network;
* **End timestamp**: time until ICO's end in Unix format;
* **Collected Ether**: amount of ether currently collected;
* **Days remaining**: days before ICO's end;
* **Token rate**: tokens exchange rate per ether;
* **Hard cap**: maximum amount of ether that can be collected for ICO (measured in smallest units of ETH – wei);
* **Total tokens**: current amount of tokens (measured in smallest token units);
* **Collected wei**: amount of currently collected ether (measured in smallest units of ETH – wei);
* **Funds address**: address to which ether is collected;
* **Start timestamp**: start time of ICO in Unix format;
* **Token address**: ICO token address (this address should be added to wallets to be able to see the tokens balance and manage them).

## View functions

View functions are not avaliable in Simple ICO. 

## Write functions

Write functions are not avaliable in Simple ICO. 
