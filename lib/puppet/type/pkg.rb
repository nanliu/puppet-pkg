Puppet::Type.newtype(:pkg) do
  @doc = "Manages packages."

  newparam(:name, :namevar=>true) do
    desc "The package name."
  end

end
