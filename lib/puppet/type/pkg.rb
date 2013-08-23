Puppet::Type.newtype(:pkg) do
  @doc = "Manages packages."

  ensurable

  newparam(:name, :namevar=>true) do
    desc "The package name."
  end

end
