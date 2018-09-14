<!-- TITLE: Atomic Swap -->
<!-- SUBTITLE: How to Deploy an Atomic Swap -->

With this simple smart contract, two participants can exchange tokens for ether or other tokens. Atomic Swap allows you to quickly and securely exchange one type of cryptoassets with another without involving a third (trusted) party. By interacting directly with each other, participants increase transaction speed, save time and provide a higher level of security.

The smart contract checks if the tokens have been received and in what quantity. If there is an error in the process, the contract rolls the transaction back. 

# Information for creating a smart contract

At the [Smartz.io](https://platform.smartz.io/) platform, in the [Atomic Swap](https://platform.smartz.io/deploy/5ac50d4e34d83a000d115517) section, you need to specify:

* **Instance Name**: the name of the smart contract
* **Participant #1**: the first participant:
    1. **Use my address**: the address of the smart contract creator will be used as the address of the first participant of the contract (checkmarked).
    2. **Address**: the address where the tokens/ether from participant #2 will be sent.
    3. **Token address**: the contract address for the ERC20 token that participant #1 is exchanging.
    4. **Tokens count**: the number of tokens that participant #1 changes for the tokens or ether of participant #2.
* **Participant #2**: the second participant:
    1. **Swap type**: the type of token exchange from participant #1 to participant #2:
        - **Ether**: ether (checkmarked);
        - **ERC20 tokens**: ERC20 standard tokens (checkmarked).
    2. **Use my address**: the address of the smart contract creator will be used as the address of the first participant of the contract (checkmarked). 
    3. **Address**: the address where the tokens/ether from participant #1 will be sent.
    4. **Ether count**: if you select ether as the exchange type, you need to specify the amount of ether that participant #2 will exchange for tokens.
    5. **Token address**: if you select ERC20 tokens as the exchange type, you need to specify the address of the token contract that participant #2 will exchange.
    6. **Tokens count**: if you select the ERC20 tokens as the exchange type, you need to specify the number of tokens that participant #2 will exchange.
* **Verify token transfers**: token transfer verification (checkmarked).

By entering the required data, you will receive the contract code.  

The contract will be deployed for free (for minimal gas transaction through Metamask Wallet).

You can also choose to open public access to the smart contract control panel by ticking Allow public access to the contract UI.

After deploying, you will be able to view the deployed contract at [Etherscan](https://etherscan.io/) or go to contract management in the [My contracts](https://platform.smartz.io/dashboard) section.

# Detailed information on the contract 

The following information about the created contract is available:

* The address of the contract in the Rinkeby network;
* **«Is finished?»**: the exchange’s status (completed or not);
* **Participant #1**: the address of participant #1;
* **Token address of participant #1**: The contract address of participant #1;
* **Tokens count of participant #1 (in token wei)**: the number of tokens of participant #1 to be exchanged for tokens/ether (in minimum units);
* **Tokens count sent by participant #1 (in token wei)**: the number of tokens that participant #1 already sent (in minimum units);
* **Participant #2**: the address of participant #2;
* **Token address of participant #2**: the token contract address of the participant #2;
* **Tokens count of participant #2 (in token wei)**: the number of tokens of participant #2 that will be exchanged for tokens of participant #1 (in minimum units);
* **Tokens count sent by the participant #2 (in token wei)**: the number of tokens that participant #2 already sent (in minimum units);

# Write functions

To change the states and values of a smart contract, you need to use the write functions that put new information in blockchain. All these functions consume some amount of gas. 

* **Swap** (`swap`): exchange tokens of participant #1 to tokens of the participant #2;
* **Refund** (`refund`): return of tokens/ether to the participants. 