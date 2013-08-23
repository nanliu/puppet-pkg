Puppet::Type.type(:pkg).provide(:yum) do
  commands :rpm => 'rpm',
           :yum => 'yum'

  def exists?
    rpm('-q', resource[:name])
  rescue Puppet::ExecutionFailure => e
    false
  end

  def install
    package = resource[:version] ? "#{resource[:name]}-#{resource[:version]}" : resource[:name]
    yum('install', resource[:install_options], package)
  end

  def remove
    yum('remove', resource[:remove_options],  resource[:name])
  end

  def version
    version = rpm('-q', resource[:name])
    if version =~ /^#{Regexp.escape(resource[:name])}-(.*)/
      $1
    end
  end

  def version=(value)
    yum('install', "#{resource[:name]}-#{resource[:version]}")
  end
end
