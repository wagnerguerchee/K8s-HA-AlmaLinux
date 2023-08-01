Vagrant.configure(2) do |config|

  # Load Balancer Node
  config.vm.define "loadbalancer" do |lb|
    lb.vm.box = "almalinux/8"
    lb.ssh.insert_key = false # 1
    lb.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', 'ansible/k8s-key.pub'] # 2
    lb.vm.provision "file", source: "ansible/k8s-key.pub", destination: "~/.ssh/authorized_keys" # 3
    lb.vm.hostname = "loadbalancer.k8s.lab"
    lb.vm.network "private_network", ip: "192.168.56.30"
    lb.vm.provider "virtualbox" do |v|
      v.name = "loadbalancer"
      v.memory = 1024
      v.cpus = 1
    end
  end

  MasterCount = 2

  # Kubernetes Master Nodes
  (1..MasterCount).each do |i|
    config.vm.define "kmaster#{i}" do |masternode|
      masternode.vm.box = "almalinux/8"
      masternode.ssh.insert_key = false # 1
      masternode.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', 'ansible/k8s-key.pub'] # 2
      masternode.vm.provision "file", source: "ansible/k8s-key.pub", destination: "~/.ssh/authorized_keys" # 3
      masternode.vm.hostname = "kmaster#{i}.k8s.lab"
      masternode.vm.network "private_network", ip: "192.168.56.10#{i}"
      masternode.vm.provider "virtualbox" do |v|
        v.name = "kmaster#{i}"
        v.memory = 2048
        v.cpus = 2
      end
    end
  end

  NodeCount = 1

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "kworker#{i}" do |workernode|
      workernode.vm.box = "almalinux/8"
      workernode.ssh.insert_key = false # 1
      workernode.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', 'ansible/k8s-key.pub'] # 2
      workernode.vm.provision "file", source: "ansible/k8s-key.pub", destination: "~/.ssh/authorized_keys" # 3
      workernode.vm.hostname = "kworker#{i}.k8s.lab"
      workernode.vm.network "private_network", ip: "192.168.56.20#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "kworker#{i}"
        v.memory = 1024
        v.cpus = 1
      end
    end
  end

end
