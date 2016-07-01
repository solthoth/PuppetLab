Exec {
  path => [
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin',
    '/usr/local/bin'
  ]
}

# -- Preinstall -- #

stage { 'preinstall':
    before => Stage['main']
}

# Define the install_package class
class install_packages {
  package { [ 'curl', 'build-essential', 'libfontconfig1', 'python',
      'nodejs', 'npm', 'g++', 'make', 'wget', 'tar', 'mc', 'htop' ]:
    ensure => present
  }
}

# Declare (invoke) install_packages
class { 'install_packages':
  stage => preinstall
}

# Setup your locale to avoid warnings
file { '/etc/default/locale':
  content => "LANG=\"en_US.UTF-8\"\nLC_ALL=\"en_US.UTF-8\"\n"
}
