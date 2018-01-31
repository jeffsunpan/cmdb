import ansible.runner
import json

runner = ansible.runner.Runner(
    module_name='setup',
    module_args='',
    pattern='127.0.0.1',
    forks=10
)
datastructure = runner.run()
data = datastructure['contacted']

for ip in data:
    print data[ip]['ansible_facts']['ansible_memory_mb']['real']['total']
