<!-- TITLE: Обмен для ERC20-токенов -->
<!-- SUBTITLE: Как развернуть Atomic Swap для ERC20-токенов -->

При помощи этого простого смарт-контракта два участника могут обменивать токены на эфир или другие токены. Atomic Swap позволяет быстро и безопасно обменивать одни криптоактивы на другие без подключения третьей (доверенной) стороны. Взаимодействуя напрямую друг с другом, участники повышают скорость транзакций, экономят время и обеспечивают более высокий уровень безопасности. 

Смарт-контракт проверяет, дошли ли токены и в каком количестве. Если в процессе возникает ошибка, контракт откатывает транзакцию назад. 

# Данные для создания смарт-контракта

На платформе [Smartz.io](https://platform.smartz.io/) в разделе [Atomic Swap](https://platform.smartz.io/deploy/5ac50d4e34d83a000d115517) необходимо указать:

* **Instance name**: название смарт-контракта;
* **Participant #1**: первый участник:
    1. **Use my address**: адрес создателя смарт-контракта будет использоваться как адрес первого участника контракта (отмечается галочкой).
    2. **Address**: адрес, куда будут отправляться токены / эфир от участника #2.
    3. **Token address**: адрес контракта ERC20-токена, которым меняется участник #1.
    4. **Tokens count**: количество токенов, которое участник #1 меняет на токены или эфир участника #2.
* **Participant #2**: второй участник:
    1. **Swap type**: тип обмена токенов от участника #1 к участнику #2:
        - **Ether**: эфир (отмечается галочкой);
        - **ERC20 tokens**: токены стандарта ERC20 (отмечается галочкой).
    2. **Use my address**: адрес создателя смарт-контракта будет использоваться как адрес первого участника контракта (отмечается галочкой). 
    3. **Address**: адрес, куда будут отправляться токены / эфир от участника #1.
    4. **Ether count**: если выбран тип обмена на эфир, то нужно указать количество эфира, которое участник #2 будет обменивать на токены.
    5. **Token address**: если выбран тип обмена ERC20 tokens, то нужно указать адрес контракта токена, который участник #2 будет обменивать.
    6. **Tokens count**: если выбран тип обмена ERC20 tokens, то нужно указать количество токенов, которое участник #2 будет обменивать.
* **Verify token transfers**: проверка передачи токенов (отмечается галочкой).

Указав необходимые данные, вы получите код контракта.  

Деплой контракта будет осуществлен бесплатно (за минимальную транзакцию газа через кошелек MetaMask).

Вы также можете указать возможность открыть публичный доступ к панели управления смарт-контрактом, поставив галочку на пункте **Allow public access to the contract UI**.

После деплоя, вы сможете просмотреть развернутый контракт на [Etherscan](https://etherscan.io) либо перейти к управлению контрактом в разделе «[My contracts](https://platform.smartz.io/dashboard)».

# Подробная информация о контракте 

Вам доступна следующая информация о созданном контракте:

* Адрес контракта в сети Rinkeby;
* **«Is finished?»**: статус обмена (завершён или нет);
* **Participant #1**: адрес участника #1;
* **Token address of participant #1**: адрес контракта токена участника #1;
* **Tokens count of participant #1 (in token wei)**: количество токенов участника #1, которые подлежат обмену на токены/эфир (в минимальных единицах);
* **Tokens count sent by participant #1 (in token wei)**: количество токенов, которые участник #1 уже отправил (в минимальных единицах);
* **Participant #2**: адрес участника #2;
* **Token address of participant #2**: адрес контракта токена участника #2;
* **Tokens count of participant #2 (in token wei)**: количество токенов участника #2, которые будут обмениваться на токены участника #1 (в минимальных единицах);
* **Tokens count sent by participant #2 (in token wei)**: количество токенов, которые участник #2 уже отправил (в минимальных единицах).

# Функции записи

Для изменения состояний и значений смарт-контракта нужно воспользоваться функциями записи, вносящими новую информацию в блокчейн. Все эти функции потребляют некоторое количество газа. 

* **Swap** (`swap`): обменять токены участника #1 на токены участника #2;
* **Refund** (`refund`): возврат токенов / эфира участникам. 