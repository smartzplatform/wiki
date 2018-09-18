# How to deploy a Merkle Airdrop smart contract

Merkle Airdrop smart contract is designed to quickly and automatically distribute tokens among any number of project participants.

The contract makes it possible to send tokens using a huge list of addresses (up to several million). The smart contract is based on the Merkle tree that allows the contract to store just one fixed-size number with information about all the data in this tree (for example, a huge list of recipient addresses).

The Merkle tree algorithm can only distribute tokens to pre-specified user addresses. Mass distribution of tokens to random addresses is impossible.

Merkle Airdrop provides millions of accounts with access to selected contract features by saving a single number to make sure the account is in the list. In the Merkle Airdrop scheme, tokens are not distributed using an address list, instead users 'claim' their tokens themselves by sending a transaction to the contract and paying a fee. Users add special data to the transaction that allows the contract to easily verify that they are whitelisted. The contract does not have to store the list itself.

This contract is very cost-effective, because it only needs one number for an address list of any size. The contract is autonomous, extremely simple to launch and does not require any support.

Merkle Airdrop can be used as part of an ICO to pay participants of the bounty campaign, as well as in any other project where you need to process large lists of user addresses and quickly distribute the tokens to the members of the community.

## How to use the contract

To deploy Merkle Airdrop, you need to have or create your own ERC20 token. These tokens will be distributed to users in the future.

You will also need a list of addresses of future token holders. You should determine in advance how many tokens will be distributed to users. Don't forget to transfer your ERC20 tokens to the new Merkle Airdrop contract after deployment.

To receive tokens, the user's wallet must have a positive balance (0.01 ETH will be enough) to pay for transactions.

The user receives tokens after calling the **Claim my tokens** function in the smart contract interface.

## Information for setting up a smart contract

Log in to your MetaMask wallet. Then log in to the Smartz.io platform and go to the Merkle Airdrop section, where you will be asked to specify the following settings for the smart contract: 

* **DApp name**: the name of the smart contract that will be used in the Smartz interface.
* **Token address**: the contract address of your ERC20 tokens. For the smart contract to be able to distribute tokens, you must first transfer them from the ERC20 contract to the Airdrop contract.
* **Airdrop whitelist**: a distribution list that includes addresses with the specified required number of tokens for each of them, is provided in a text file. File format: `<Ethereum address><space><number of tokens with the smallest calculation unit (Wei)>`.

After providing the necessary information, you will see the contract code. Please note that after downloading the address list, you will receive a link to the list (save it) and a unique number (MerkleRoot) containing information about the recipients of tokens.

You can also restrict public access to the contract interface by ticking Restrict public access to the contract UI.

After deployment, you can view the deployed contract at Etherscan or go to the Dashboard to manage the contract. 

## View functions

These functions provide information about the contract status and value. 

* **Merkle root**: a fixed-size number with information about all the recipient addresses.
* **Token contract**: the contract's address in Ethereum.
* **Airdrop token balance**: the current total number of tokens in the wallet.

## Write functions 

To change the states and values of a smart contract, use the write functions that add new information to the blockchain. All these functions consume a certain amount of Ether. 

* **Claim my tokens** (`getTokensByMerkleProof`): is used to transfer tokens to the user. To get tokens, you need to call this function for an address from the airdrop_list text file. If the address is whitelisted, the user will receive tokens in their wallet.
* **Update airdrop whitelist** (`setRoot`): is used to update the list of contract participants.
* **Cancel airdrop** (`claim_rest_of_tokens_and_selfdestruct`): is used to return all tokens to the airdrop owner address and terminate the contract.
