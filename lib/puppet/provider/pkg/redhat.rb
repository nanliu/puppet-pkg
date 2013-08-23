Puppet::Type.type(:pkg).provide(:yum) do
  commands :rpm => 'rpm',
           :yum => 'yum'

  def exists?
    rpm('-q', resource[:name])
  rescue Puppet::ExecutionFailure => e
    false
  end

end
