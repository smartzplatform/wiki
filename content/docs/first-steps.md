# First steps to using the platform on the example of Simple ICO smart contract

To access the platform, you must complete a simple login procedure.

Go to [smartz.io](https://smartz.io/) and click **Login** button to log in with your Ethereum signature: you need to unlock MetaMask (or other) extension and sign the transaction. If you don't have MetaMask extension see section "Creating a test wallet" for details. After this you’re redirected to the page with available smart contracts.

!!! warning
    The authors are not responsible for any possible losses resulting from your use of the alpha version of the service with an Ethereum wallet. To use our service, you need to connect the Rinkeby test network.

## Creating a test wallet

To use the platform, you must install the MetaMask client, which is an Ethereum wallet embedded in your browser. This enables interactions with the Ethereum network without previously installing and synchronizing a full Ethereum node or any other additional software on your PC.

The client is available as a browser extension, and is currently accessible in [Google Chrome](https://chrome.google.com/webstore/detail/nkbihfbeogaeaoehlefnkodbefgpgknn), [Firefox](https://addons.mozilla.org/en-US/firefox/addon/ether-metamask/) and [Opera](https://addons.opera.com/en/extensions/details/metamask/). Here we’ll take a look at how to install MetaMask in Google Chrome. For other browsers, the procedure is virtually the same.

![1](/uploads/first-steps/1.png "1")

To run the client, go to its [website](https://metamask.io/) and click **GET CHROME EXTENSION**. This redirects you to the Chrome Web Store. When the page loads, click **ADD TO CHROME**. After the plugin is automatically installed, it is visible in the top right corner of the browser (fox head logo). After you accept the terms of use for the client (**Accept**), you’ll be redirected to the password entry box.

![2](/uploads/first-steps/2.png "2")

Enter your desired password. After that, the client automatically generates a list of 12 keywords required to recover access to MetaMask. MetaMask encrypts all data, and without these 12 keywords you will not be able to ever recover access. We recommend you save this list in a file and write it down on paper.

![3](/uploads/first-steps/3.png "3")

Click **SAVE SEED WORDS AS FILE** to save the keywords on your PC.

Then click **I’VE COPIED IT SOMEWHERE SAFE**. Now you can click the plugin icon in the top right corner of the browser window to use the wallet.

![4](/uploads/first-steps/4.png "4")

After you open the wallet, click the dropdown list in the top left corner to expand the available networks menu. By default, **Main Ethereum Network** is selected. You must select **Rinkeby Test Network** on your own.

![5](/uploads/first-steps/5.png "5")

A test network account will then appear. Copy the address by selecting field under the **DETAILS** button.

At this time, there are 0 ethers in your newly created wallet. To start testing, you need at least a few ether in your wallet. To do this, you can use what’s known as an Ethereum faucet. For our purposes, we recommend the [Rinkeby Authenticated Faucet](https://faucet.rinkeby.io/).

![6](/uploads/first-steps/6.png "6")

The Rinkeby test network is protected against a number of attack types. To pass the protection barrier, you have to make post containing your Ethereum wallet address in one of the following three social networks: Twitter, Google+ or Facebook.

To request funds, publish a post containing your wallet address, as well as some other text (optional). Copy the URL of your post and add the link to the box in the top of the Rinkeby Authenticated Faucet page. After the ethers are deposited in your wallet, you may delete the post. Example of the link to the Facebook post in the address bar:

![7](/uploads/first-steps/7.png "7")

By clicking **Give me Ether**, you can select the required Ether amount. For a one-time testing you only need a small number of ethers. However, to have enough ethers for tests in the future, we recommend requesting the maximum possible amount. Click the **18.75 Ethers / 3 days** menu item. The time span listed after the Ether amount is the minimum interval before you can submit another request. The ethers will arrive in your wallet within a few minutes.

![8](/uploads/first-steps/8.png "8")

In a couple of seconds a green text box should appear, which means the transaction was successful.

## Accessing Simple ICO. Step №1

After the ethers are deposited in your account, return to the platform’s home page and click the deploy button next to the **Simple ICO** contract.

Then you must fill in all the following fields on the next page:

* Contract name (3–100 digits, Latin letters only);
* Token name (3–100 digits, Latin letters and spaces only);
* Ticker (token emblem, 3–10 digits, Latin letters w/o spaces);
* Token burning feature (checkbox);
* ICO start date;
* ICO end date;
* Exchange rate — ether token exchange rate (e.g., if you specify 100, this means that 1 Ether will be purchased for 100 tokens);
* Hard cap — the top limit for fundraising during the ICO;
* Funds address.

The resulting page will look as follows (example):

![9](/uploads/first-steps/13.png "13")

Click **Proceed** at the bottom of the page.

## Accessing Simple ICO. Step №2

Click **Deploy now** on the page that opens.

![10](/uploads/first-steps/14.png "14")

A wallet window then pops up, where you must re-check all the information and click **SUBMIT**.

## Running Simple ICO

In a few minutes, your contract will be made available in the network.

![11](/uploads/first-steps/15.png "15")

Click the contract address for more information.

![12](/uploads/first-steps/12.png "12")

Congratulations! You just created a smart contract for a simple ICO.
