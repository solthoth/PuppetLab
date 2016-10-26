# == Define: define_name
#
define website (
  $port = 3000
  ) {
  $bindinginfo = [{
    protocol => 'HTTP',
    port     => $port,
    }]

  file { [
    'c:/firstagain',
    'c:/firstagain/backoffice'
  ]:
    ensure  => 'directory',
  }

  dsc_xwebapppool { 'FirstAgainBackOfficePool_Pool':
    dsc_ensure => 'present',
    dsc_name   => 'FirstAgain BackofficePool'
  }
}
