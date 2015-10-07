CMD = ansible-playbook -i hosts

prereqs:
	ansible-galaxy install -r roles/requirements.yml -f

provision: prereqs
	$(CMD) site.yml

clean:
	rm -rf masters
