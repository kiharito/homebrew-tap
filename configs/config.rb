require 'json'

class Config
  def initialize(package_name)
    path = File.join(File.dirname(__FILE__), "#{package_name}.json")
    @config = JSON.parse(File.read(path))
  end

  def mac_arm64
    @config["mac"]["arm64"]
  end

  def mac_x86_64
    @config["mac"]["x86_64"]
  end

  def linux_arm64
    @config["linux"]["arm64"]
  end

  def linux_x86_64
    @config["linux"]["x86_64"]
  end
end
