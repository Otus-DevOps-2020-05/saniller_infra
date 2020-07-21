# saniller_infra

### ДЗ 10 - Ansible 1 ###

#### Выполнение плейбука на клонирование репозитория или поддержание актуальности:
ansible-playbook clone.yml
Если удалить, например так:
ansible app -m command -a 'rm -rf ~/reddit'
и затем снова применить, то будет информация что были изменения.

#### Примеры команд с использованием модулей без использования плейбука:
ansible app -m command -a uptime
ansible app -m command -a 'ruby -v'
ansible app -m shell -a 'ruby -v; bundler -v'
ansible all -m ping
ansible db -m systemd -a name=mongod
ansible app -m git -a \
 'repo=https://github.com/express42/reddit.git dest=/home/appuser/reddit'

### ДЗ 9 - Terraform 2 ###
1) Научились использовать модули: terraform get для инициализации модулей
2) Научились создавать инфраструктуру в разных окружениях, используя одинаковые модули


### ДЗ 8 - terraform ###
Научились деплоить приложение reddit ререз терраформ.
Научились использовать основные команды терраформа, переменные. Применять, изменять, уничтожать инфраструктуру.

Для использования terraform:
1) Инициализация: terraform init
2) Переименовываем файл настроек, чтобы читался: mv terraform.tfvars.example terraform.tfvars
3) Задаём настройки
4) terraform apply


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
