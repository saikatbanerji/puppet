First import the classes in foreman.

##########################################################

class example($pkgname) {

notify {"Class variables :::::::$pkgname":}
$filename ="server.xml"
$osfamily ="redhat"
$hieraversion = hiera("version")
notify {"Local variables :::::::: $filename":}
notify {" Global variables :::::::: $::osfamily":}
notify {" Hiera  variables :::::::: $hieraversion":}
file {"/home/ubuntu/$filename":
ensure => file,
 source => "puppet:///modules/example/server.xml"

}

}
