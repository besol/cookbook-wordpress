name             "wordpress"
maintainer       "Barry Steinglass"
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs/Configures WordPress"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.1"

recipe "wordpress", "Installs and configures WordPress LAMP stack on a single system"

%w{ php openssl }.each do |cb|
  depends cb
end

depends "apache2", ">= 0.99.4"
depends "mysql", ">= 1.0.5"

%w{ debian ubuntu }.each do |os|
  supports os
end

attribute "wordpress/version",
  :display_name => "WordPress download version",
  :description => "Version of WordPress to download from the WordPress site or 'latest' for the current release.",
  :default => "latest"

attribute "wordpress/checksum",
  :display_name => "WordPress tarball checksum",
  :description => "Checksum of the tarball for the version specified.",
  :default => ""

attribute "wordpress/dir",
  :display_name => "WordPress installation directory",
  :description => "Location to place WordPress files.",
  :default => "/var/www/wordpress"

attribute "wordpress/db/remote/host",
  :display_name => "MySQL Host Database",
  :description => "WordPress will connect to this MySQL remote host.",
  :default => "localhost"

attribute "wordpress/db/remote/user",
  :display_name => "MySQL Host Database User",
  :description => "WordPress will connect to this MySQL remote host with this user.",
  :default => "root"

attribute "wordpress/db/remote/password",
  :display_name => "MySQL Host Database Password",
  :description => "WordPress will connect to this MySQL remote host with this password.",
  :default => "randomly generated"

attribute "wordpress/db/database",
  :display_name => "WordPress MySQL database",
  :description => "WordPress will use this MySQL database to store its data.",
  :default => "wordpressdb"

attribute "wordpress/db/user",
  :display_name => "WordPress MySQL user",
  :description => "WordPress will connect to MySQL using this user.",
  :default => "wordpressuser"

attribute "wordpress/db/password",
  :display_name => "WordPress MySQL password",
  :description => "Password for the WordPress MySQL user.",
  :default => "randomly generated"

attribute "wordpress/keys/auth",
  :display_name => "WordPress auth key",
  :description => "WordPress auth key.",
  :default => "randomly generated"

attribute "wordpress/keys/secure_auth",
  :display_name => "WordPress secure auth key",
  :description => "WordPress secure auth key.",
  :default => "randomly generated"

attribute "wordpress/keys/logged_in",
  :display_name => "WordPress logged-in key",
  :description => "WordPress logged-in key.",
  :default => "randomly generated"

attribute "wordpress/keys/nonce",
  :display_name => "WordPress nonce key",
  :description => "WordPress nonce key.",
  :default => "randomly generated"

attribute "wordpress/server_aliases",
  :display_name => "WordPress Server Aliases",
  :description => "WordPress Server Aliases",
  :default => "FQDN"
