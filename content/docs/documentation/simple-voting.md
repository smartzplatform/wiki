# How to Deploy a Simple Voting smart contract

The smart contract allows participants to vote in different polls. The contract works very simply: it initializes the transparent voting system for the specified variants and displays the total number of votes each variant receives.

Any user who has a little ether can create a poll (ballot). The contract allows you to set up the variants and the list of participants. Any user can vote after receiving a link to the poll from the organizer by selecting the preferred option. Once a participant has voted, they won't be able to change their vote in the poll.

Voting, storage and counting of votes is carried out in the Ethereum blockchain, which ensures full transparency of the final results and eliminates fraud. Voting is completely safe because Ethereum acts as a third party in the process of interaction between the organizer and the participants to ensure the correct vote count and confidentiality.

## Data for Creating a Smart Contract

On Smartz.io platform, in the [Simple voting](https://platform.smartz.io/deploy/5a9a4df0f5ec65000b80d293) page, you need to specify the token information:

* **Instance name**: the name of the smart contract;
* **Ballot name**: the name of the ballot;
* **Variants**: answer variants.

After entering the required data, you will receive the contract code.

The contract will be deployed for 0.05 ether (through the MetaMask wallet).

After network deployment, you can view the deployed contract at Etherscan or manage the contract in the [My contracts](https://platform.smartz.io/dashboard) page.

## Detailed Information on the Contract

The following information about the created contract is available:

* **Ballot topic** (`ballotName`): the subject (name) of the ballot;
* **Winning variant ID** (`getWinningVariantId`): the ID of the winning variant;
* **Winning variant votes count** (`getWinningVariantVotesCount`): the number of votes for the winning variant;
* **Winning variant name** (`getWinningVariantName`): the name of the winning variant.

## View Functions

You can use the view functions to obtain information on the status of the contract and the values associated with any address or other conditions that you need to specify. These functions don't make any changes to the blockchain:

* **Get votes count** (`Getvotescount`): the count of votes by Variant ID;
* **Get votes count** (`getVotesCountByName`): the count of votes by Variant name;
* **"Has address voted?"** (`isVoted`): checks if the specified address has voted.

## Write Functions

To change the states and values of a smart contract, you need to use Write functions that enter new information to the blockchain. All these functions consume some amount of gas.

* **Vote** (`vote`): vote by Variant ID;
* **Vote** (`voteByName`): vote by Variant name.
