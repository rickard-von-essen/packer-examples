Vagrant.configure("2") do |config|
  config.ssh.shell = "sh -l"
  config.ssh.username = "docker"

  # Attach the b2d ISO so that it can boot
  config.vm.provider "parallels" do |p|
    p.check_guest_tools = false
    p.customize "pre-boot", [
      "set", :id,
      "--device-add", "cdrom",
      "--image", File.expand_path("../boot2docker.iso", __FILE__),
      "--enable", "--connect"
    ]
    p.customize "pre-boot", [
      "set", :id,
      "--device-bootorder", "cdrom0 hdd0"
    ]
  end
end
