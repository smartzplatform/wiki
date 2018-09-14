<!-- TITLE: Загрузка контракта -->
<!-- SUBTITLE: Как загрузить свой смарт-контракт на платформу Smartz -->

Смарт-контракт — это код, выполняющийся внутри блокчейна. Контракт может быть написан на разных языках программирования и под разные блокчейны, сейчас на платформе Smartz доступна загрузка смарт-контрактов в Ethereum на языке Solidity.

Собственный контракт добавляется на странице «[Add a smart contract](https://platform.smartz.io/ctor-add)», где вам необходимо будет указать публичное название смарт-контракта, выбрать файл с исходным кодом контракта в формате .py, а также добавить описание и цену деплоя.

Для загрузки смарт-контракта необходимо написать конструктор на языке Python, в котором будет представлен шаблон вашего смарт-контракта, а также несколько функций, необходимых для отображения страниц интерфейса и генерации кода контракта с заданными пользователем параметрами. В нашем [SDK](https://github.com/smartzplatform/SDK) можно подробнее ознакомиться с примерами конструкторов и используемой JSON-схемой.

Ниже рассмотрим конструктор уже имеющегося контракта — simple voting. Этот код используется всякий раз, когда вы создаете новый смарт-контракт вне зависимости от его предназначения.

# Формирование первоначальных обязательных значений

В самом начале нужно произвести импорт необходимых функций и объявить класс `Constructor`:

``` python
from smartz.api.constructor_engine import ConstructorInstance

class Constructor(ConstructorInstance):
```

Далее объявляется метод, который определяет версию и блокчейн конструктора:

``` python
    def get_version(self):
        return {
            "result": "success",
            "blockchain": "ethereum",
            "version": 2
        }
```

Далее объявляется метод, который отвечает за страницу на первом шаге деплоя вашего контракта – `get_params(self)`.

``` python
    def get_params(self): 
```

`get_params` — это метод класса, предназначенный для получения параметров контракта.

``` python
        json_schema = {
```

Далее идет `json_schema` — описание структур в формате JSON, предназначенное для определения доступных полей для ввода и валидации данных в них. В нем указываются обязательные варианты для ввода данных, которые отображаются в интерфейсе на первом шаге создания контракта.

``` python
            "type": "object",
            "required": 
                "name", "variants"
            ],

            "additionalProperties": False,
```

Наличие других дополнительных атрибутов блокируется значением параметра `additionalProperties`.

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

Формируются поля для ввода обязательных данных на этапе создания смарт-контракта. В данном случае это:

* название (name) голосования;
* варианты (variants) ответов.

Устанавливаются ограничения на длину и класс вводимых символов. Более подробно об этих параметрах можно прочитать в материале о создании simple voting смарт-контракта.

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

Задается массив вариантов голосования. Каждый элемент массива тоже определяется. Массив в Python — это упорядоченный изменяемый объект, имеющий ограничение на тип данных и размер каждого элемента.

Таким образом мы указываем название для нашего голосования, а также количество возможных вариантов ответа. 

``` python
        ui_schema = {}

        return {
            "result": "success",
            "schema": json_schema,  
            "ui_schema": ui_schema
        }
```

`ui_schema` не используется в данном примере смарт-контракта, но может использоваться для других контрактов. 

Метод возвращает `json_schema`, `ui_schema` и `"result": "success"`.

# Генерация кода контракта

Следующий метод отвечает за генерацию кода контракта:

``` python
    def construct(self, fields): 
```

В этом примере метод генерирует код контракта на основе переменной `_TEMPLATE`, которая содержит в себе шаблон вашего заранее подготовленного контракта.

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

В самом шаблоне вы можете видеть параметры вида `%name%`, вместо которых подставляются значения, которые задал пользователь на первом шаге деплоя контракта.

``` python
            .replace('%name%', fields['name']) \
            .replace('%variants_code%', variants_code)

        return {
            'result': "success",
            'source': source,
            'contract_name': "SimpleBallot"
        }
```

Метод `replace` заменяет все вхождения одной строки на другую. В данном случае метод возвращает нам в интерфейс название голосования и указанные варианты для ответов. 

# Формирование страницы в дашборде

Третий метод отвечает за формирование страницы контракта в разделе [My Contracts](https://platform.smartz.io/dashboard) и определяет все доступные для просмотра поля и возможные вызываемые функции контракта.

``` python
    def post_construct(self, fields, abi_array):
```

Метод определяет отражение страницы в дашборде со всеми указанными доступными функциями чтения и функциями записи.

В самом коде контракта у нас используется несколько функций, которые возвращают строки с различными данными: название, ID побеждающего варианта и т. д.

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

Далее находится шаблон кода смарт-контракта на языке Solidity, в котором в качестве переменных подставляются значения, получаемые от пользователя. Эти значения касаются вариантов ответов и названия при формировании голосования.

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

Таким образом, Smartz позволяет работать не только со сгенерированным на платформе кодом. Вы можете загрузить собственный код, изменив в нем параметры на необходимые для формирования пользовательского смарт-контракта. Полный код конструктора, который был разобран в этом документе, [доступен](https://github.com/smartzplatform/SDK/tree/master/constructor_examples) на github.
