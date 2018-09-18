# How to deploy a Ledger smart contract

A universal ledger is a smart contract used to store various data on distributed nodes. This smart contract is used to store information from various profiles – for example, documents about graduation from an educational institution (diplomas) or professional certificates. If a paper document is lost, you will not need to obtain a duplicate – all data is stored electronically.

Another example of working with the Ledger is the transaction of buying and selling shares. Shareholders keep securities at home, on the account in the depository or are limited to a record in the register (a non-documentary security). In all these cases, the shareholder is not insured against theft or loss of documents. And in the case of the sale of securities, it is necessary to seek the assistance of an intermediary – for example, a depository.

We also want to draw customers' attention to the convenience of using the Ledger for the management of patients' medical records and issuing sick leave certificates. Clinical records will be available only to specific individuals (doctors, employers or an insurance company) in a secure and confidential manner. We welcome decisions that will ensure the growth of the quality of health services.

In addition, the Ledger is equally convenient to use in the following situations:

* generation of a CV (as well as a work record);
* accumulation of points and cashback on bonus, discount or miles cards;
* creation of lists of paid taxes, available penalties (debts), property and income (for tax return);
* fast application for loans or obtaining an insurance certificate (when all the necessary information for the bank or the insurance company is previously entered into the Ledger);
* settlement of legal issues of copyright items: storage of data on the ownership of works of specific authors (and the distribution of rights among them), data on purchased and sold works (for consumers of content and owners of rights).

## Usage scenarios

Let us discuss the usage scenario when the Ledger smart contract is used to verify a university diploma.

1) The administrator runs a Ledger smart contract with fields **Text field** (full name), **Text hash field**, **Url field** (link to scan of diploma), **File hash field**.
2) The administrator adds to the Ledger the data about the graduates of a certain faculty and the  graduation year.
3) The administrator publishes the data of the smart contract on the official website of the university.
4) The graduate in the CV indicates the fact of graduation from the university and the possibility of verification of the availability of the diploma using a smart contract.
5) The potential employer goes to the Smartz platform and opens the public control panel page of the smart contract.
6) The potential employer uses the control panel to look for the required person by the Full Name field.
7) The potential employer finds the right person and checks the URL with the scan of the diploma and hash file to make sure the document is authentic.

## Data for Creating a Smart Contract

On the Smartz.io platform in the [Ledger](https://platform.smartz.io/deploy/5ada07d44a5ad7000a19d643) section:

*	**Instance name**: the name of the smart contract that will be displayed in the My Contracts section;
*	**Ledger name**: the name of the ledger, for example "Diplomas Ledger";
*	**Ledger description**: a description of the ledger, for example "MSU Faculty of Computational Mathematics and Cybernetics 2020";
*	**Record name**: the title of the record, for example "Student".

4 fields are available for selection (marked with a tick):
 
**1. Text field**: text field;
**Text field description**: description of the test field, for example "Full name".

**2. Text hash field**: text hash field;
**Text hash field description**: description of the test hash field, for example "Full name hash" – computed automatically.

**3. Url field**: field for UR;
**Url field description**: description for the URL field, for example "URL with diploma scan".

**4. File hash field**: field for file hash;
**File hash field description**: a description for the file hash field, for example "Hash of diploma scan".

Having specified the necessary data, you will receive the contract code.  

The contract is deployed free of charge (via the MetaMask wallet). You can also specify the possibility to open public access to the contract by ticking **Allow public access to the contract UI**.

After the deploy, you can view the expanded contract on [Etherscan](https://etherscan.io/) or go to contract management in the section "[My contracts](https://platform.smartz.io/dashboard)".

## Details of the contract 

The following information about the created contract is available to you:

*	contract address;
*	**Ledger name**: the name of the ledger you specified;
*	**Ledger description**: your ledger description;
*	**Record type**: type indicated by the name of the record;
*	**Records count**: number of entries made ‑ from 0 up;
*	**Owner**: the address of the contract owner in the Ethereum network.

### View Functions

You can use view functions to obtain information on the status of the contract. They ensure search inside the ledger. The availability and names of these functions depend on the fields selected during the deploy – you can search by each of the selected fields, as well as by record ID. These functions make no changes to the blockchain.

*	**Find record by id** (`records`): find the entry in the ledger by the specified ID.
*	**Find Student by Full name** (`findByFullName`): the example uses the search of a student by full name.
*	**Find Student by Full name hash** (`findByFullNameHash`); you also can find the student (in this example) by hash.
*	**Find Student by URL with diploma scan** (`findByUrlWithDiplomaScan`): search for the student using the URL specified in the deploy.
*	**Find Student by Hash of diploma scan** (`findByHashOfDiplomaScan`): search for the student using a hash (you need to upload the file).

### Write functions

To change the statuses and values of a smart contract, you need to use the write functions that introduce new information into the blockchain. All these functions consume some amount of gas. 

*	**Add Student to ledger** (`addRecord`): add an entry to the ledger – you must specify the name for the entry, hash name, URL address and choose a file for hash calculation. 
*	**Transfer ownership** (`transferOwnership`): transfer the right to add records to the ledger – you must specify the address of the person who will receive the owner's rights.
