# saniller_infra
### ДЗ 7 - packer build in yandex cloud ###
Команда для билда образа с использованием стороннего файла с секретами - variables.json.
cd packer && packer build -var-file variables.json ubuntu16.json

### ДЗ 6 ###

testapp_IP = 35.198.167.169
testapp_port = 9292


### ДЗ 5 ###


##### Для входа на someinternalhost с использованием VPN, используем настройки cloud-bastion.ovpn и vpn клиент (я использовал Pritunl client for windows).

bastion_IP = 130.193.39.173
someinternalhost_IP = 10.130.0.16

##### Для входа на someinternalhost без VPN c использованием секретного ключа appuser (не находится в репозитории):
###### Сначала запускаем ssh forwarding
for windows:
  exec ssh-agent bash
for all:
  ssh-add -L
  ssh-add ~/.ssh/appuser

###### Затем подключаемся одной командой:
ssh -tt -i ~/.ssh/appuser -A appuser@130.193.39.173 'ssh 10.130.0.16'
