<!-- TITLE: BetMe -->
<!-- SUBTITLE: How to deploy a BetMe smart contract -->

BetMe smart contracts are designed to resolve disputes through mediation of the selected arbiter who makes decisions that are binding on all parties. The Disputant (Owner) creates a smart contract that contains a true (in the opinion of the Disputant) statement and then places a bet. The Opponent is against this statement and also places a bet. The value of bet depends on the amount of ether sent.

The contract owner chooses an arbiter to resolve the dispute. If necessary, the owner can specify a penalty to be paid by the arbiter if a decision in favour of a disputing party is not made.

The address of the arbiter can only be determined by the owner. Further, the address may be rewritten (the arbiter may be changed) several times until the selected arbiter confirms their participation.

When the address of the arbiter is specified, the arbiter shall confirm participation in the dispute resolution by sending ether. After confirmation by the arbiter, the owner cannot change the arbiter's address or the penalty amount until the contract is executed. However, the arbiter may refuse to perform a resolution before the opponent makes a bet.

To determine the winner of the dispute, the arbiter shall declare the statement of the owner as true/false or declare that the statement cannot be verified for any reason (in case of force majeure). In this case, the arbiter does not pay the penalty and refunds the insurance premium. The contract owner and the opponent get their bet amounts back.

If no decision is made before the approved deadline, the arbiter may not withdraw the tokens, and each disputing party shall receive his/her bet amount and 50% of the insurance premium due to the arbiter.

BetMe contracts can be used to resolve disputes concerning the results of a match, championships, elections and any other activities. Smart contracts protect against fraud attempts by all disputing parties. The blockchain protects bet amounts and desired results against unauthorised manipulation. The open source code, availability of the contract to any user, as well as automatic performance of agreed terms exclude the influence of the human factor and solve all common problems regarding disputes and betting.

# Information for setting up a smart contract

Log in to your MetaMask wallet. Then log in to the Smartz.io platform and go to the BetMe constructor, where you will be asked to specify the following settings for the smart contract: 

* DApp name: the name of the smart contract that will be used in the Smartz interface.
* Assertion text: the subject of the dispute is a statement that is true in the opinion of the contract owner.
* Deadline: the deadline by which the arbiter must resolve the dispute.
* Arbiter Ethereum address: Ethereum address of the arbiter who will decide if the statement is true or false.
* Arbiter fee percent: the percentage of the dispute (bet) amount to be received by the arbiter.
* Opponent Ethereum address: the opponent's address in Ethereum. Leave the field blank to allow anyone to bet against your statement.
* Arbiter deposit amount: the amount of ether, which the arbiter sends to the contract as a guarantee to resolve the dispute and receives back after the decision is made.

After providing the necessary information, you will see the contract code.

You can also restrict public access to the contract interface by ticking Restrict public access to the contract UI.

After deployment, you can view the deployed contract at Etherscan or go to the Dashboard to manage the contract. 

# Information about the contract

This is information about the states and values in the contract, which is available in the Dashboard.

* **Assertion text**: a statement put forward by the contract owner.
* **Deadline**: the current deadline to complete the contract.
* **Current bet amount**: the owner's bet amount.
* **Arbiter has made decision**: shows if the arbiter has made a decision (yes or no).
* **Owner address**: the owner's address.
* **Arbiter address**: the address of the arbiter who determines if the statement is true/false.
* **Opponent address**: the opponent's address. If the address was not specified at the time the contract was created, any user can bet that the owner's statement is false.
* **Arbiter fee percent**: the current cost of the arbitration specified as a percentage of the bet amount.
* **Arbiter fee in ether**: the amount of remuneration to the arbiter taking into account the bet amount and the cost of the arbitration.
* **Arbiter deposit amount**: the amount, which the arbiter provides as a guarantee that the dispute shall be resolved.
* **State version number**: the version number for the current state that is passed as a parameter to ensure consistency between the ToBecameArbiter and betAssertIsFalse functions.
* **Arbiter agreed to judge**: the state of the arbiter, which indicates whether participation in the dispute has been confirmed.
* **Opponent confirmed his bet**: the state of the opponent, which indicates whether the bet has been made.
* **Arbiter considered assertion true or false**: confirmation that the arbiter agrees to resolve the dispute and that the arbiter considers the statement to be true/false.
* **Owner payout**: the amount due to the owner.
* **Opponent payout**: the amount due to the opponent.
* **Arbiter payout**: the amount due to the arbiter.
* **Owner claimed payout**: the parameter that specifies whether the owner has withdrawn the payment after resolving/cancelling the dispute.
* **Opponent claimed payout**: the parameter that specifies whether the opponent has withdrawn the payment after resolving/cancelling the dispute.
* **Arbiter claimed payout**: the parameter that specifies whether the arbiter has withdrawn the payment after resolving/cancelling the dispute.
* **Current timestamp**: the current time.

# Write functions

To change the states and values of a smart contract, use the write functions that add new information to the blockchain system. All these functions consume a certain amount of ether. 

* **Change assertion text**: this function is used to record a new statement from the owner.
* **Change deadline**: this function is used to set a new deadline for the dispute.
* **Change arbiter fee percent**: this function is used to set a new value for the arbiter fee.
* **Change arbiter deposit**: this function is used to change the amount of penalty that the arbiter shall pay if no decision is made before the approved deadline.
* **Change arbiter address**: this function is used to record the address of the arbiter (it must be specified before the arbiter agrees to resolve the dispute).
* **Change opponent address**: this function is used to record the address of the opponent.
* **Owner Bet**: the owner places a bet.
* **Agree to be an arbiter**: this function allows a user to become an arbiter for this dispute and send the insurance amount to the contract (if it is not equal to zero).
* **Arbiter self retreat**: the arbiter may decide not to resolve the dispute before the opponent places a bet.
* **Opponent Bet**: the opponent bets that the statement is false.
* **Arbiter**: assertion is True: after analysing the text, the arbiter confirms that the statement is true.
* **Arbiter**: assertion is False: after analysing the text, the arbiter confirms that the statement is false.
* **Arbiter**: assertion cannot be checked: this function indicates that it is not possible to verify the statement when the arbiter confirms the text of a statement that cannot be considered to be true/false due to force majeure (for example, if the match on which the bets were placed was postponed to a time after the deadline for resolution of the dispute).
* **Get payout**: to withdraw their share of the funds (ether), each participant calls the Withdraw function.
* **Drop contract**: the owner can destroy the contract at some stages (for example, in the absence of an opponent).