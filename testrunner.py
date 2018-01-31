# -*- coding=utf-8 -*-
import ansible.runner
import ansible.inventory
##########################


hosts_list = ['10.70.71.157', '10.70.71.156']
#example_inventory = ansible.inventory.Inventory(hosts_list)

runner = ansible.runner.Runner(
            host_list = hosts_list,                           #指定主机文件 
            module_name = 'setup',                          #使用ansible的shell
            module_args = '',
            pattern = 'all',                               #主机文件中生效的组
            forks = 5,                                      #多进程并发数量
#            remote_pass = '123456',                         #远程执行的密码
            #is_playbook= True,
        )
datastructure = runner.run()
print datastructure['contacted']

