<!-- TITLE: EOS Smart Contracts -->
<!-- SUBTITLE: Deploying Smart Contracts on the EOS Blockchain Using Scatter -->

To create a smart contract that works in EOS, you need to perform several actions:

* install the Scatter add-on
* register in the desired EOS network; we will consider your registration in the CryptoLions testnet: http://dev.cryptolions.io
* deploy an EOS Simple Token contract on the Smartz platform 

# How to use the Scatter add-on 

![](/uploads/eos-token/11.jpg)

Scatter is an add-on for Google Chrome and Mozilla Firefox designed to interact with the EOS blockchain (similar to Metamask for Ethereum).

Once registered, you can use a variety of decentralized Scatter applications without having to log in again while you are online.

**Install the add-on**

For Chrome: https://chrome.google.com/webstore/detail/ammjpmhgckkpcamddpolhchgomcojkle
For Firefox: https://addons.mozilla.org/en-US/firefox/addon/scatter/

All operations will be demonstrated by the example of Chrome. You can do the same in Firefox.

**Generate a key**

Log in to Scatter, set a password, and save a mnemonic phrase (this is necessary for your secure identification).

![](/uploads/eos-token/2.png)

While in Scatter, go to the Key Pairs section and click New, then specify a name and generate the keys. Be sure to copy your public key; you will need it in the next step.

![](/uploads/eos-token/3.png)

**Add a test network**

![](/uploads/eos-token/4.png)

Click Settings (the gear icon) in the top right corner of the Scatter window, then click **Networks** and **New**.

Complete the fields as shown below:

* domain: jungle.eos.smartz.io
* port: 443.

Save the settings. 

# Register in the test network

![](/uploads/eos-token/5.png)

Go to http://dev.cryptolions.io. Select the **Create account** section.

![](/uploads/eos-token/6.png)

Enter your account name and paste the public key provided by Scatter. The newly created account will be used for deploy the smart contract.

![](/uploads/eos-token/7.png)

Then go back to Scatter. Select **Identities** and **New**. In the window that appears, find the **Account** section. 

Select the previously added network and your dev.cryptolions.io account, then click **Import** and save the settings. This Identity belongs to the account that will be used to deploy the smart contract.

# Deploy the EOS Simple Token contract

![](/uploads/eos-token/8.png)

Go to https://smartz.io/.

To log in, please click **Login** and then choose **LOGIN WITH YOUR EOS SIGNATURE VIA SCATTER**. In the newly opened Scatter window, select your account and click **Accept**.

![](/uploads/eos-token/9.png)

By default, the Store section displays applications to create smart contracts on Ethereum. Please open the EOS tab. 

Click EOS simple token to perform the deployment. Please provide the following information:

* smart contract name
* token ticker
* number of decimal places

Click **Process**. 

You can make the source code of the smart contract private by checking the Restrict public access to the contract UI checkbox.

Enter your account name and paste the public key provided by Scatter.

Click **Deploy for free** to deploy your smart contract for free.

![](/uploads/eos-token/10.jpg)

Confirm the action in the newly opened Scatter window.