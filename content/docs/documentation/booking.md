<!-- TITLE: Booking -->
<!-- SUBTITLE: A quick summary of Booking -->

This smart contract allows you to rent out various real estate properties to any customers without involving intermediaries. You can just specify all the necessary characteristics of the property (apartment, hotel room, etc.), and your customers will receive a convenient and easy-to-use tool for booking accommodation. Rental prices, terms, cancellation fees and other details are registered in the smart contract itself and stored in the blockchain. 

The landlord creates a separate contract each time, which allows you to specify individual rental conditions. The renter can cancel the booking; however, the owner can set an N-hour period before the actual arrival time. After this period, it will be possible to cancel the booking only upon paying a penalty. Before renting the premises, the customer must confirm that all the claimed characteristics and conditions are true to fact.

# Information necessary to create a smart contract

Go to Smartz.io and specify the following information in the [Booking](https://staging.smartz.io/deploy/5ad08a85eb5e820006467154/0) section:

* **Instance name** – the name of the smart contract;
* **Object description** – the description of the property (address, area, etc.);
* **Price** – the rental price of the property for the entire period (it should exceed the cancellation fee);
* **URL of file with additional description** – the URL of the file with additional information (images, PDFs or presentations);
* **Hash of file above** – a file hash that is calculated automatically when the file with additional information is uploaded;
* **Cancellation fee** – the booking cancellation fee;
* **Start rent time** – the rental start date;
* **End rent time** – the rental end date;
* **No cancel time (in hours)** – the number of hours before the rental start (after this period, fines will be charged for booking cancellation);
* **Accept object time (in hours)** – the period of time during which the customer can confirm the compliance of the property after the rental start.

After specifying the required data, you will receive a contract code. The contract will be deployed free of charge (using the MetaMask wallet).

You can also provide public access to your contract by ticking the Allow public access to the contract UI checkbox.

Deployed contracts will be available on [Etherscan](https://etherscan.io/) or under [My contracts](https://platform.smartz.io/dashboard).

# Contract information 

The following information about the contract that you have created will be available to you:

* contract address on Etherscan.

## View functions

You can use the View functions to obtain information about the status of the contract and details related to any address or other conditions that you should specify. These functions do not make any changes in the blockchain:

* **Owner** – the owner’s address;
* **Client address** – the address of the property’s renter;
* **Object description** – the description of the property (address, area, etc.);
* **Description URL** – the URL of the file with additional information;
* **Description hash** – a hash of the file with additional information;
* **Start rent time** – the rental start date;
* **End rent time** – the rental end date;
* **Rent price** – the rental price;
* **Cancellation fee** – the booking cancellation fee;
* **No cancel time** – the time period after which a cancellation fee is charged;
* **Accept object time** – the period of time during which the customer can confirm the compliance of the property;
* **Get booking state** – the booking status.

## Write functions

Write functions are used to change states and values in the smart contract (these functions introduce new information into the blockchain). Each of the following functions consumes some gas: 

* **Refund (customer)** (`refund`) – make a refund for the booking;
* **Reject payment (owner)** (`rejectPayment`) – reject the payment (this function is available to the owner);
* **Cancel booking (owner)** (`cancelBooking`) – cancel the booking (this function is available to the owner);
* **Start rent (customer)** (`startRent`) – start the rental period (this function is available to the renter);
* **Transfer ownership (owner)** (`transferOwnership`) – transfer ownership of the contract by specifying the address of the new owner (this function is available to the owner).