# == Class: setupiis
#
class setupiis {
  dsc_windowsfeature { 'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
  }
  dsc_windowsfeature { 'IISManagementTool':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Console',
  }
  dsc_windowsfeature { 'IISManagementCompat':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Compat',
  }
  dsc_windowsfeature { 'AspNet45':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Asp-Net45',
  }
  dsc_windowsfeature { 'IISScriptingTools':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Scripting-Tools',
  }
}
