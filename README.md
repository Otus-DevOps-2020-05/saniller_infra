# saniller_infra
saniller Infra repository

bastion_IP = 130.193.39.173
someinternalhost_IP = 10.130.0.16

### Вход на someinternalhost без VPN c использованием секретного ключа appuser, который не находится в репозитории: ###
# Сначала запускаем ssh forwarding
# for windows:
exec ssh-agent bash
# for all:
ssh-add -L
ssh-add ~/.ssh/appuser

# команда на вход в одной строке:
ssh -tt -i ~/.ssh/appuser -A appuser@130.193.39.173 'ssh 10.130.0.16'
