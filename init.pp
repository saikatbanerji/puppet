class jdk8 {

  file {"/etc/puppetlabs/code/environments/production/modules/jdk8/files/jdk-8u171-linux-x64.tar.gz":
    ensure => file,
    source =>"puppet:///extra_files/jdk-8u171-linux-x64.tar.gz"

       }

exec { 'extract the jdk tar file':
    command => 'tar -xf /etc/puppetlabs/code/environments/production/modules/jdk8/files/jdk-8u171-linux-x64.tar.gz',
    cwd => '/home/ubuntu',
    path    => '/usr/local/bin/:/bin/',
   require => File["/etc/puppetlabs/code/environments/production/modules/jdk8/files/jdk-8u171-linux-x64.tar.gz"]
       }

  file {"/home/ubuntu/jdk8":
         ensure => 'link',
    target => '/home/ubuntu/jdk1.8.0_171',
  require => Exec['extract the jdk tar file']

       }
       
 $profile ="/root/.profile"
file {"$profile":
         ensure => 'file' ,
        content => template("jdk8/profile.erb"),
require => File['/home/ubuntu/jdk8']



}
