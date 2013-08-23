Puppet::Type.type(:pkg).provide(:yum) do
  commands :rpm => 'rpm',
           :yum => 'yum'

  def exists?
    rpm('-q', resource[:name])
  rescue Puppet::ExecutionFailure => e
    false
  end

  def create
    yum('install', resource[:name])
  end

  def destroy
    yum('remove', resource[:name])
  end
end
