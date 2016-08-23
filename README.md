# Repository to track public ansible code

### debug-logging.yaml usage:
Because of the many components and settings available for debug logging, I've broken down the playbook into tags that are intended to be used along with the limit subset (-l) of ansible-playbook command. Each component has a tag to "check" the debug logging setting, "set" or enable the debug logging, and lastly "unset" or disable the debug logging. Here are some examples to illustrate intended usage:


`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l overcloud -t cinder-check-debug`
`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l overcloud -t cinder-set-debug`
`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l overcloud -t cinder-unset-debug`

`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l compute -t nova-check-debug`
`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l compute -t nova-set-debug`
`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l compute -t nova-unset-debug`

`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l overcloud -t glance-check-debug`

`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml -l undercloud -t ironic-check-debug`

or run all check, set, unset tasks on all hosts (works fine, but you probably want to specify limit and tag):

`ansible-playbook -i tripleo-ansible-inventory.py validations/debug-logging.yaml`
