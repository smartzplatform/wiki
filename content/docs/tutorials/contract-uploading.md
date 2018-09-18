# How to upload your smart contract to Smartz platform

A smart contract is a code that runs inside blockchain. The contract can be written in different programming languages and for different blockchains. Now Smartz platform provides smart contract uploading to Ethereum written on Solidity language.

You can add your own contract on the “[Add a smart contract](https://platform.smartz.io/ctor-add)” page, where you need to specify the public name of smart contract, select the file with source code of the contract in ‘.py’ format, and add the description and the deployment price.

To upload a smart contract, you need to write a Python constructor that will have the template of your smart contract, as well as several functions required to display the interface pages and generate the contract code with the settings specified by user. Check out our [SDK](https://github.com/smartzplatform/SDK) to learn more about constructor examples and used JSON schema.

Below we'll examine the constructor of smart contract we already have: simple voting. This code is used whenever you create a new smart contract regardless of its purpose.

## Formation of Initial Values

First, you need to import the necessary functions and declare the class `Constructor`:

``` python
from smartz.api.constructor_engine import ConstructorInstance

class Constructor(ConstructorInstance):
```

Declare the method which specifies constructor version and blockchain:

``` python
    def get_version(self):
        return {
            "result": "success",
            "blockchain": "ethereum",
            "version": 2
        }
```

Next, you declare the method for page in the first step of deploying your contract – `get_params`.

``` python
   def get_params(self):
```

`get_params` is the class method that is designed to get the parameters of the contract.

``` python
       json_schema = {
```

Next is ```json_schema```, the description of structures in JSON format, designed to define the available fields for inputing and validating data in them. It specifies the obligatory data entry options that appear in the interface in the first step of contract creation.

``` python
           "type": "object",
            "required": 
                "name", "variants"
            ],

            "additionalProperties": False,
```

Other additional attributes are blocked with the value of `additionalProperties`.

``` python
           "properties": {
                "name": { 
                    "title": "Ballot name", 
                    "type": "string",
                    "minLength": 3,
                    "maxLength": 200,
                    "pattern": "^[a-zA-Z0-9,\. ]+$" 
                },
```

The fields for entering obligatory data are generated during smart contract creation phase. In this case, these are:

* name of the ballot;
* variants of answers.

The limits on the length and class of input characters are set here. You can read more about these parameters in the material on creating a simple voting smart contract.

``` python
               "variants": {                 
                    "title": "Variants",
                    "type": "array",
                    "minItems": 1,
                    "maxItems": 100, 
                    "items": {
                        "type": "object", 
                        "required": ["variant"],
                        "additionalProperties": False,


                        "properties": {
                             "variant": {
                                "title": "Variant",
                                "type": "string",
                                "minLength": 1,
                                "maxLength": 200,
                                "pattern": "^[a-zA-Z0-9,\. ]+$"
                            },
                        }
                    }
                }

            }
        }
```

The array of voting choices is set here too. Each element of the array is also defined. An array in Python is an ordered changeable object that has a constraint on the data type and the size of each element.

In this way, we specify the name for our ballot as well as the number of possible answers.

``` python
       ui_schema = {}

        return {
            "result": "success",
            "schema": json_schema,  
            "ui_schema": ui_schema
        }
```

`ui_schema` is not used in this smart contract example but can be used for other contracts.

This method returns `json_schema`, `ui_schema`, and `"result": "success"`.

## Contract Code Generation

The following method is responsible for generating contract code:

``` python
   def construct(self, fields):
```

In this example, the method generates contract code based on the `_TEMPLATE` variable, which contains the template of your contract prepared in advance.

``` python
       variants_code = ''

        for variant_id, variant in enumerate(fields['variants']):
            variant_descr = variant['variant']

            variants_code += """
                variants.push('{variant_descr}');variantIds[sha256('{variant_descr}')] = {variant_id};
            """.format(
                variant_descr=variant_descr,
                variant_id=variant_id+1
            )

        source = self.__class__._TEMPLATE \
```

In the template itself, you can see parameters like `%name%`, which are substituted with the values set by the user in the first step of deploying the contract.

``` python
           .replace('%name%', fields['name']) \
            .replace('%variants_code%', variants_code)

        return {
            'result': "success",
            'source': source,
            'contract_name': "SimpleBallot"
        }
```

The `replace` method replaces all occurrences of one string with another. In this case, the method returns name of the ballot and the specified options for answers to our interface.

## Creating a Page in the Dashboard

The third method is for creating contract page in the [My Contracts](https://platform.smartz.io/dashboard) section, and it defines all the fields available for viewing and possible callable functions of the contract.

``` python
   def post_construct(self, fields, abi_array):
```

The method defines representation of а page in the dashboard with all available read and write functions.

In the contract code itself, we use several functions that return strings with different data: name, winning variant ID, etc.

``` python
       function_titles = {
            'ballotName': {
                'title': 'Ballot topic',
            },

            'variants': {
                'title': 'Get variant name by ID',
                'inputs': [{
                    'title': 'Variant ID',
                }]
            },

            'isVoted': {
                'title': 'Has address voted?',
                'inputs': [{
                    'title': 'Address to check',
                }]
            },

            'vote': {
                'title': 'Vote',
                'description': 'Vote by variant ID',
                'inputs': [{
                    'title': 'Variant ID',
                }]
            },

            'voteByName': {
                'title': 'Vote',
                'description': 'Vote by variant name',
                'inputs': [{
                    'title': 'Variant name',
                }]
            },

            'getVotesCount': {
                'title': 'Get votes count',
                'description': 'Get votes count by variant ID',
                'inputs': [{
                    'title': 'Variant ID',
                }]
            },

            'getVotesCountByName': {
                'title': 'Get votes count',
                'description': 'Get votes count by variant name',
                'inputs': [{
                    'title': 'Variant name',
                }]
            },


            'getWinningVariantId': {
                'title': 'Winning variant ID',
            },

            'getWinningVariantName': {
                'title': 'Winning variant name',
            },

            'getWinningVariantVotesCount': {
                'title': 'Winning variant votes count',
            },
        }

        return {
            "result": "success",
            'function_specs': merge_function_titles2specs(make_generic_function_spec(abi_array), function_titles),

            'dashboard_functions': ['ballotName', 'getWinningVariantId', 'getWinningVariantName', 'getWinningVariantVotesCount']
        }
```

Next, we find a template for a smart contract code in Solidity, where the values received from the user are substituted instead of the variables. These values concern the answer variants and the name of the ballot.

``` python
   # language=Solidity
    _TEMPLATE = """
pragma solidity ^0.4.18; 

/**
 * @title Simple Ballot
 */
contract SimpleBallot {

    string public ballotName;

    string[] variants;

    mapping(uint=>uint) votesCount;
    mapping(address=>bool) public isVoted;

    mapping(bytes32=>uint) variantIds;

    function SimpleBallot() public payable {
        ballotName = '%name%';

        variants.push(''); // for starting variants from 1 (non-programmers oriented)

        %variants_code%

        assert(variants.length <= 100);
    }

    modifier hasNotVoted() {
        require(!isVoted[msg.sender]);

        _;
    }

    modifier validVariantId(uint _variantId) {
        require(_variantId>=1 && _variantId<variants.length);

        _;
    }

    /**
     * Vote by variant id
     */
    function vote(uint _variantId)
        public
        validVariantId(_variantId)
        hasNotVoted
    {
        votesCount[_variantId]++;
        isVoted[msg.sender] = true;
    }

    /**
     * Vote by variant name
     */
    function voteByName(string _variantName)
        public
        hasNotVoted
    {
        uint variantId = variantIds[ sha256(_variantName) ];
        require(variantId!=0);

        votesCount[variantId]++;
        isVoted[msg.sender] = true;
    }

    /**
     * Get votes count of variant (by id)
     */
    function getVotesCount(uint _variantId)
        public
        view
        validVariantId(_variantId)
        returns (uint)
    {

        return votesCount[_variantId];
    }

    /**
     * Get votes count of variant (by name)
     */
    function getVotesCountByName(string _variantName) public view returns (uint) {
        uint variantId = variantIds[ sha256(_variantName) ];
        require(variantId!=0);

        return votesCount[variantId];
    }

    /**
     * Get winning variant ID
     */
    function getWinningVariantId() public view returns (uint id) {
        uint maxVotes = votesCount[1];
        id = 1;
        for (uint i=2; i<variants.length; ++i) {
            if (votesCount[i] > maxVotes) {
                maxVotes = votesCount[i];
                id = i;
            }
        }
    }

    /**
     * Get winning variant name
     */
    function getWinningVariantName() public view returns (string) {
        return variants[ getWinningVariantId() ];
    }

    /**
     * Get winning variant name
     */
    function getWinningVariantVotesCount() public view returns (uint) {
        return votesCount[ getWinningVariantId() ];
    }
}


    """
```

Thus, Smartz allows you to work with more than just the code generated on the platform. You can upload your own code, changing the parameters that you need for the user smart contract. The complete constructor code that was examined in this document is [available](https://github.com/smartzplatform/SDK/tree/master/constructor_examples) on our github.
