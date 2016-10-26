# == Class: iiswebsite
#
class iiswebsite {
  include chocolatey

  reboot { 'dsc_reboot':
    when  => pending,
  }
  package { 'powershell':
    ensure   => '5.0.10586.20151218',
    provider => 'chocolatey',
    notify   => Reboot['dsc_reboot'],
  }
  package { 'dotnet4.5.1':
    ensure   => '4.5.1.20140606',
    provider => 'chocolatey',
    notify   => Reboot['dsc_reboot'],
  }

  include iiswebsite::setupiis
}
