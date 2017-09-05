Puppet::Type.newtype(:mongodb_database) do
  @doc = "Manage MongoDB databases."

  ensurable

  newparam(:name, :namevar=>true) do
    desc "The name of the database."
    newvalues(/^[\w-]+$/)
  end

  newparam(:admin_username) do
    desc "Admin's user name needed to create the user. Only needed if auth is enabled on the server.
     This should be identical to the mongodb::server::admin_user property"

    newvalues(/^[\w-]+$/)
  end

  newparam(:admin_password) do
    desc "Admin's user cleartext password needed to create the user. Only needed if auth is enabled on
     the server. This should be identical to the mongodb::server::admin_user property"

    newvalues(/^[\w-]+$/)
  end

  newparam(:tries) do
    desc "The maximum amount of two second tries to wait MongoDB startup."
    defaultto 10
    newvalues(/^\d+$/)
    munge do |value|
      Integer(value)
    end
  end

  autorequire(:package) do
    'mongodb_client'
  end

  autorequire(:service) do
    'mongodb'
  end
end
