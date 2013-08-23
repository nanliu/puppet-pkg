Puppet::Type.newtype(:pkg) do
  @doc = "Manages packages."

  ensurable do
    newvalue(:present) do
      provider.install
    end

    newvalue(:absent) do
      provider.remove
    end
  end

  newparam(:name, :namevar=>true) do
    desc "The package name."
  end

  newproperty(:version) do
  end

  newparam(:install_options) do
    defaultto('-y')
  end

  newparam(:remove_options) do
    defaultto('-y')
  end
end
