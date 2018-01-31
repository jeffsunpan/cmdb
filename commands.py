from DB import writeDb
import ansible.runner
#import ansible.inventory
import json

#ip_address = []
#sql_ip = "select ip from hosts;"
#result_ip = main.readDb(sql_ip, )
#for ip_dict in result_ip:
#    ip_address.append(ip_dict['ip'])

hosts_list = ['10.70.68.90']
example_inventory = ansible.inventory.Inventory(hosts_list)

runner = ansible.runner.Runner(
    host_list=hosts_list,
    module_name='setup',
    module_args='',
    pattern='all',
    forks=1,
)
datastructure = runner.run()['contacted']


for ip in datastructure:
    Default_IP = datastructure[ip]['ansible_facts']['ansible_default_ipv4']['address']
    Total_Memory = datastructure[ip]['ansible_facts']['ansible_memory_mb']['real']['total']
    CPUs = datastructure[ip]['ansible_facts']['ansible_processor_vcpus']
    Arch = datastructure[ip]['ansible_facts']['ansible_architecture']
    Distribution = datastructure[ip]['ansible_facts']['ansible_distribution']
    Kernel = datastructure[ip]['ansible_facts']['ansible_kernel']
    DistributionVersion = datastructure[ip]['ansible_facts']['ansible_distribution_version']

    data = (DistributionVersion, Kernel, Total_Memory, Distribution, Arch, CPUs, Default_IP)
    print data
    sql = """
            UPDATE hosts SET
            distributionversion=%s,kernel=%s,memory=%s,distribution=%s,arch=%s,cpus=%s
            WHERE ip=%s
        """

    result = writeDb(sql, data)
