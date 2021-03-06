<!-- TITLE: Токен ERC20 -->
<!-- SUBTITLE: Как развернуть токен стандарта ERC20 -->

ERC20 – стандарт токенов, получивший широкую поддержку в блокчейне Ethereum для проектов, запускающих ICO. Стандарт упрощает совместимость токенов со сторонними сервисами, на разных платформах, для различных децентрализованных приложений. 

ERC-20 описывает функции токена, которые можно реализовать в смарт-контракте, и позволяет легко взаимодействовать с другими смарт-контрактами в блокчейне. Для обработки транзакций токенов ERC20 нужно использовать «газ», приобретаемый за эфир. 

# Данные для создания смарт-контракта

На платформе Smartz.io в разделе [ERC20 token](https://platform.smartz.io/deploy/5a9a4d63f5ec65000b80d290) необходимо указать:

* **Instance name**: название смарт-контракта, которое будет отображаться в разделе My Contracts;
* **Name of a token**: название токена;
* **Token Symbol**: символ токена;
* **Decimals**: количество десятичных знаков после запятой;
* **«Can token owner mint new tokens?»**: возможность делать дополнительную эмиссию токенов;
* **Max tokens count**: максимальное количество токенов;
* **Premint tokens**: количество токенов, созданных до основной эмиссии/ICO;
* **«Can token holders burn their tokens?»**: возможность сжигать свои токены 
* **«Token owner will be able to pause token functions»**: возможность приостанавливать функции токена.

Указав необходимые данные, вы получите код контракта.  

Деплой контракта будет осуществлен за 0.1 эфира (через кошелек MetaMask).

После деплоя в сети вы сможете просмотреть развернутый контракт на Etherscan либо перейти к управлению контрактом в разделе «[My contracts](https://platform.smartz.io/dashboard)».

# Подробная информация о контракте 

Вам доступна следующая информация о созданном контракте:

* **Minting finished** (`mintingFinished`): статус эмиссии (минтинга) токена: завершена или продолжается;
* **Token name** (`name`): название токена;
* **Total supply** (`totalSupply`): общее число существующих токенов;
* **Decimal places** (`decimals`): количество десятичных чисел в дробной части токена;
* **Maximum tokens** (`cap`): максимально возможное число токенов;
* **Paused** (`paused`): статус передачи токенов (можно передавать или на паузе);
* **Owner** (`owner`): адрес владельца токена;
* **Token ticker** (`symbol`): сокращенное название токена, используемое на биржах.

# Функции опроса

Вы можете воспользоваться опрашивающими функциями (Ask functions)  для получения информации о состоянии контракта и значениях, связанных с каким-либо адресом или другими условиями, которые вы должны указать. Эти функции не выполняют никакие изменений в блокчейне:

* **Get balance** (`balanceOf`): узнать баланс токена на любом адресе; 
* **View allowance** (`allowance`): просмотреть количество токенов, которые владелец токена (Address of owner) разрешил потратить с другого адреса (Address of spender).

# Функции записи

Для изменения состояний и значений смарт-контракта нужно воспользоваться функциями записи (Write functions), вносящими новую информацию в блокчейн. Все эти функции потребляют некоторое количество газа. 

* **Approve spending** (`approve`): разрешает указанному адресу тратить указанное количество токенов.
* **Transfer from** (`transferFrom`): переводит токены из одного аккаунта в другой.
* **Enable circulation** (`unpause`): включает передачу токенов в случае приостановки переводов.
* **Mint new tokens** (`mint`): эмиссия новых токенов.
* **Burn tokens** (`burn`): уничтожает указанное количество токенов.
* **Decrease approval** (`decreaseApproval`): уменьшает указанному адресу количество токенов, которые могут быть потрачены.
* **Finish minting** (`finishMinting`): отключает дальнейшую эмиссию токена.
* **Pause circulation** (`pause`): отключает любые переводы токенов.
* **Transfer tokens** (`transfer`): переводит часть ваших токенов на другой адрес.
* **Increase approval** (`increaseApproval`): увеличивает указанному адресу количество токенов, которые могут быть потрачены. 
* **Transfer ownership** (`transferOwnership`): передает право собственности на токен другому адресу.