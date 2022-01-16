#!make

net:
	ansible-playbook ./ansible/orchestration/network.yml -i ./ansible/inventory/cloud.yml

nodea:
	ansible-playbook ./ansible/orchestration/nodeA.yml -i ./ansible/inventory/cloud.yml

nodeb:
	ansible-playbook ./ansible/orchestration/nodeB.yml -i ./ansible/inventory/cloud.yml

nodec:
	ansible-playbook ./ansible/orchestration/nodeC.yml -i ./ansible/inventory/cloud.yml

cluster:
	ansible-playbook ./ansible/orchestration/setenvironment.yml -i ./ansible/inventory/cloud.yml

dns:
	ansible-playbook ./ansible/orchestration/dns.yml -i ./ansible/inventory/cloud.yml