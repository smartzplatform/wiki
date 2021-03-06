<!-- TITLE: Merkle Airdrop -->
<!-- SUBTITLE: Как развернуть смарт-контракт Merkle Airdrop -->

Cмарт-контракт Merkle Airdrop предназначен для автоматического и быстрого распределения токенов среди любого количества участников проекта.

Контракт дает возможность разослать токены по огромному количеству (вплоть до нескольких миллионов) адресов. Смарт-контракт построен на базе алгоритма Merkle tree, который позволяет хранить в контракте одно число фиксированного размера, содержащее в себе информацию обо всех включенных в дерево данных (например, об огромном списке адресов получателей).

Алгоритм Merkle tree способен распределять токены только по заранее указанным адресам пользователей. Исключается вероятность массового распространения токенов среди случайных адресов.

Merkle-Airdrop предоставляет доступ к выбранным функциям контракта миллионам аккаунтов, записав единственное число для проверки принадлежности аккаунта к списку. В схеме Merkle Airdrop токены не рассылаются по адресам – пользователи сами «требуют» свои токены, отправляя транзакции в контракт и оплачивая комиссию. В транзакцию пользователи добавляют данные, позволяющие контракту легко проверить, находятся ли они в «белом» списке адресов. Причем сам список контракту помнить совершенно не обязательно.

Этот смарт-контракт является крайне экономным – ему необходимо всего лишь одно число для списка адресов любого размера. Контракт прост в запуске, автономен и не требует никакой поддержки. 
Merkle Airdrop можно использовать на ICO для вознаграждения участникам bounty-кампании и в любом другом проекте, где нужно оперировать большими списками адресов пользователей и быстро раздавать токены сообществу. 

# Как использовать контракт

Перед развертыванием Merkle Airdrop вам необходимо иметь или создать свой ERC20-токен. Именно эти токены будут в дальнейшем распределяться среди пользователей.

Затем вам понадобится список адресов будущих держателей токенов. Вы также заранее должны определить, какое количество токенов будет распределяться среди пользователей. Не забудьте отправить ваши ERC20-токены на новый контракт Merkle Airdrop после развертывания. 

Чтобы получить токены, кошелек пользователя должен иметь положительный баланс (не обязательно много, достаточно 0.01 ETH) для оплаты транзакций. 

Пользователь получает токены, вызвав функцию **Claim my tokens** в интерфейсе смарт-контракта.

# Данные для создания контракта

Зайдите в ваш кошелек MetaMask. Затем залогиньтесь на платформе Smartz.io и перейдите в раздел [Merkle Airdrop](https://smartz.io/deploy/cec1727ed5a63fb9aaf81ff1/2), где вам будет предложено указать следующие параметры смарт-контракта:

* **Dapp name**: название смарт-контракта, которое будет использоваться в интерфейсе Smartz;
* **Token address**: адрес контракта ваших токенов стандарта ERC20. Чтобы смарт-контракт мог раздавать токены, сначала вы должны перенести их из ERC20 контракта в контракт Airdrop;
* **Airdrop whitelist**: список распределения, состоящий из адресов с указанным количество требуемых токенов для каждого, предоставляется в текстовом файле. Формат файла `<адрес Ethereum><пробел><количество токенов в наименьшей единице исчисления (Wei)>`.

Указав необходимые данные, вы увидите код контракта. Обратите внимание, что после загрузки списка адресов, вы получите ссылку на список, которую необходимо сохранить, и уникальное число MerkleRoot, содержащее информацию о получателях токенов.

Вы можете ограничить публичный доступ к интерфейсу контракта, поставив галочку на пункте **Restrict public access to the contract UI**.

После деплоя вы сможете просмотреть развернутый контракт на [Etherscan](https://etherscan.io/), либо перейти к управлению контрактом в разделе «[Dashboard]( https://smartz.io/dashboard)».

# Функции просмотра

Эти функции предоставляют информацию о состояниях и значениях контракта. 

*	**Merkle root**: число фиксированного размера, которое содержит в себе информацию обо всех адресах получателей.
*	**Token contract**: адрес контракта в Ethereum. 
*	**Airdrop token balance**: текущее общее количество токенов на балансе.

# Функции записи

Для изменения состояний и значений смарт-контракта нужно воспользоваться функциями записи, вносящими новую информацию в блокчейн. Все эти функции потребляют некоторое количество газа.

* **Claim my tokens** (`getTokensByMerkleProof`): отправляет токены пользователю.  Чтобы получить токены необходимо вызвать эту функцию для адреса, находящегося в списке airdrop_list.txt. Если адрес находится в «белом списке», пользователь получит токены на свой кошелек.
* **Update airdrop whitelist** (`setRoot`): обновляет список участников контракта.
* **Cancel airdrop** (`claim_rest_of_tokens_and_selfdestruct`): возвращает все токены на адрес владельца Airdrop и прекращает действие контракта.