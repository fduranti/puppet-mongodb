require File.expand_path(File.join(File.dirname(__FILE__), '..', 'mongodb'))
Puppet::Type.type(:mongodb_globals).provide(:mongodb, :parent => Puppet::Provider::Mongodb) do

  desc "Manages MongoDB global properties used to access the DB."

  defaultfor :kernel => 'Linux'

  mk_resource_methods

  def self.instances
    # Always return an empty array at startup
    []
  end

  def create
    Puppet.debug "Puppet globals created. Username #{resource[:admin_username]}"

    set_admin_user(resource[:admin_username])
    set_admin_password(resource[:admin_password])

    @property_hash[:ensure] = :present
  end

  def exists?
    !(@property_hash[:ensure] == :absent or @property_hash[:ensure].nil?)
  end

end
