Vagrant.require_version ">= 2.2.4"
Vagrant.configure(2) do |config|
  # Base box
  config.vm.box = "ubuntu/lunar64"

  # Virtual machine details - VirtualBox
  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.cpus = 4
    v.memory = 4096
    v.name = "PandocMermaidAction"
    v.default_nic_type = "virtio"

    if Vagrant::Util::Platform.windows? then
      v.customize ["modifyvm", :id, "--uartmode1", "client", "NUL"]
    else
      v.customize ["modifyvm", :id, "--uartmode1", "file", "/dev/null"]
    end
  end

  # Shared folder owner to ubuntu instead of vagrant
  config.vm.synced_folder ".", "/vagrant", name: "vagrant", disabled: false
end
