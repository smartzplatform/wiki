<!-- TITLE: Мультитокен -->
<!-- SUBTITLE: Как развернуть Multitoken -->

С помощью этого смарт-контракта вы можете создать токены, не относящиеся к стандарту ERC20, и проводить различные операции с токенами, существующими только внутри этого смарт-контракта. Решение позволяет клиентам быстро получать токены от вас или других лиц на любой указанный адрес.

С помощью токенов в таком контракте можно легко токенизировать любые объекты в реальном мире, определять и передавать право собственности на них.

# Данные для создания смарт-контракта

На платформе [Smartz.io](https://platform.smartz.io/) в разделе [Multitoken](https://platform.smartz.io/deploy/5ac50d5a34d83a000d115518) необходимо указать:

* **Instance name**: название смарт-контракта;
* **Decimals**: количество десятичных знаков после запятой;
* **Tokens for creator**: количество токенов для создателя контракта;
* **Mask for subtokens ID**: маска для ID субтокена, по сути число, ограничивающее общее количество различных токенов, которые могут быть созданы в смарт-контракте.

Указав необходимые данные, вы получите код контракта.  

Вы также можете указать возможность открыть публичный доступ к панели управления смарт-контрактом, поставив галочку на пункте Allow public access to the contract UI.

После деплоя, вы сможете просмотреть развернутый контракт на [Etherscan](https://etherscan.io) либо перейти к управлению контрактом в разделе «[My contracts](https://platform.smartz.io/dashboard)».

# Подробная информация о контракте 

Вам доступна следующая информация о созданном контракте:

* **Mask**: маска для ID субтокена;
* **Decimals**: количество десятичных знаков после запятой;
* **Owner**: адрес владельца.

# Функции опроса

Вы можете воспользоваться опрашивающими функциями для получения информации о состоянии контракта и значениях, связанных с каким-либо адресом или другими условиями, которые вы должны указать. Эти функции не выполняют никаких изменений в блокчейне.

**View allowance** (`allowance`): просмотр количества токенов, которое держатель токенов разрешил тратить другому адресу:

* **Token ID**: идентификатор токена;
* **Address of owner**: адрес держателя токенов, который может передавать токены;
* **Address of spender**: адрес спендера, которому разрешено тратить полученные токены.

**Get balance** (`balanceOf`): узнать баланс токенов любого адреса:

* **Token ID**: идентификатор токена;
* **Address**: адрес держателя токенов.
* **Total supply** (`totalSupply`): общая сумма предложений токенов:
* **Token ID**: идентификатор токена.

# Функции записи

Для изменения состояний и значений смарт-контракта нужно воспользоваться функциями записи, вносящими новую информацию в блокчейн. Все эти функции потребляют некоторое количество газа. 

**Create new subtoken** (`createNewSubtoken`): создать новый субтокен и передать на указанный адрес:

* **Token ID**: идентификатор токена;
* **Address of owner**: адрес, который получает субтокены;
* **Tokens count**: количество создаваемых токенов.

**Transfer from** (`transferFrom`): перевод токенов из одного аккаунта в другой:

* **Token ID**: идентификатор токена;
* **From**: перемещайте токены из этого аккаунта;
* **To**: передавайте токены к этому аккаунту;
* **Amount**: количество токенов.

**Approve spending** (`approve`): разрешить указанному адресу потратить некоторое количество ваших токенов:

* **Token ID**: идентификатор токена;
* **Address**: адрес, которому разрешено тратить токены;
* **Amount**: количество токенов.

**Transfer ownership** (`transferOwnership`): передать право собственности на токен другому адресу (необходимо для выполнения некоторых административных операций):

* **Address**: адрес, который получит право собственности.

**Transfer tokens** (`transfer`): передать некоторое количество ваших токенов другому адресу:

* **Token ID**: идентификатор токена;
* **To**: адрес получателя;
* **Amount**: количество токенов.