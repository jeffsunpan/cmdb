from DB import writeDb
import ansible.runner
#import ansible.inventory
import json


hosts_list = ['10.70.68.90']
#!/usr/bin/env python
# coding=utf-8
import ansible.playbook
from ansible import callbacks
from ansible import utils
import json
import ansible.inventory.host

#example_host = ansible.inventory.host.Host(
#    {name = '127.0.0.1',port = 22
#)
#
#example_group = ansible.inventory.group.Group(
#    name='sample_group_name'
#)
#example_group.add_host(example_host)
#
#example_inventory = ansible.inventory.Inventory()
#example_inventory.add_group(example_group)
#example_inventory.subset('sample_group_name')

stats = callbacks.AggregateStats()
playbook_cb = callbacks.PlaybookCallbacks(verbose=utils.VERBOSITY)
runner_cb = callbacks.PlaybookRunnerCallbacks(stats,verbose=utils.VERBOSITY)
res=ansible.playbook.PlayBook(
            playbook='/root/PycharmProjects/task/ansible_file/playbooks/test/test.yml',
            stats=stats,
            callbacks=playbook_cb,
            host_list=hosts_list,
            runner_callbacks=runner_cb
    ).run()
data = json.dumps(res,indent=4)
print data