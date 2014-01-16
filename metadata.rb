name              "mercurial"
maintainer        "Demandforce, Inc."
maintainer_email  "yai@dfengg.com"
license           "Apache 2.0"
description       "Installs mercurial 2.2.3"
version           "0.0.1"

supports "centos"
supports "ubuntu"
supports "redhat"

recipe "mercurial::default", "Installs mercurial 2.2.3"

attribute "ag/inst_dir",
	:required => 'optional',
	:default => '/usr/local'

attribute "ag/hg/pylib",
	:required => 'optional',
	:default => 'python-hglib-0.1.tar.gz'

attribute "ag/hg/src_pkg",
	:required => 'optional',
	:default => 'mercurial-2.2.3.tar.gz'

attribute "ag/mysql/rpm",
	:required => 'optional',
	:default => 'MySQL-server-5.5.20-1.rhel4.x86_64.rpm'

depends           "build-essential"
