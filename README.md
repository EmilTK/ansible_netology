Плейбук демонстрирующий работу с ролями
=========

Установка Elasticsearch, Kibana, Filebeat

Requirements
------------

  * https://github.com/netology-code/mnt-homeworks-ansible
  * https://github.com/EmilTK/kibana-role
  * https://github.com/EmilTK/filebeat-role

Variables
--------------

  Для установки одной версии всех систем, необходимо в `group_vars/all.yml` определить переменную с желаемой версией систем, и назначить данную роль для следующих переменных:

  * elasticsearch_version
  * kibana_version
  * filebeat_version
