CMD = ansible-playbook -i hosts

dns:
	$(CMD) generate_zones.yml

provision: dns
	$(CMD) site.yml

clean:
	rm -rf masters
