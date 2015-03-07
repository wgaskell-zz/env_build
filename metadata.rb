name             'phpapp'
maintainer       '1020198 PaaS'
maintainer_email 'w.g@wlv.ac.uk'
license          'All rights reserved'
description      'Installs/Configures phpapp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          "apache2"
depends          "mysql", "5.5.4"
