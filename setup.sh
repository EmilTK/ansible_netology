#!/usr/bin/env bash

declare -A container
container=(["ubuntu"]="latest" ["centos"]="7" ["fedora"]="latest")

for val in "${!container[@]}";
do
  if [[ ${container[$val]} == "latest" ]]; then
    contName=$val
  else
    contName=$val${container[$val]}
  fi
  echo "----- Running a container - $contName -----"
  docker run -d --rm --name $contName  pycontribs/$val:${container[$val]} sleep 600000
done

echo "----- Running ansible-playbook -----"
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

echo "----- Stopping and deleting containers -----"

for val in "${!container[@]}";
do
  if [[ ${container[$val]} == "latest" ]]; then
    contName=$val
  else
    contName=$val${container[$val]}
  fi
  docker stop $contName
done
