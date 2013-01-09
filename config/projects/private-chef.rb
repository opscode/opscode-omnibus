name "private-chef"

replaces        "private-chef-full"
install_path    "/opt/opscode"
build_version   Omnibus::BuildVersion.new.semver
build_iteration "1"

# initialize the dependencies
deps = []

# global
deps << "chef-pc"
deps << "private-chef-cookbooks"
deps << "private-chef-administration"
deps << "private-chef-scripts"
deps << "private-chef-ctl"
deps << "nginx"
deps << "runit"
deps << "unicorn"

# the backend
deps << "couchdb"
deps << "postgresql"
deps << "redis"
deps << "rabbitmq"
deps << "opscode-solr"
deps << "opscode-expander"
deps << "chef-sql-schema" # needed to migrate the DB.
deps << "keepalived"
deps << "bookshelf"

# the front-end services
deps << "oc_erchef"
deps << "opscode-reporting"
deps << "opscode-chef"
deps << "opscode-account"
deps << "opscode-webui"
deps << "opscode-authz"
deps << "opscode-org-creator"
deps << "opscode-certificate"
deps << "opscode-platform-debug"
deps << "opscode-test"
deps << "mysql2"

# monitoring
deps << "nagios"
deps << "nagios-plugins"
deps << "opscode-nagios-plugins"
deps << "nrpe"

# oc-chef-pedant for integration/smoke testing
deps << "oc-chef-pedant"

# partybus and upgrade scripts
deps << "partybus"
deps << "private-chef-upgrades"

# version manifest file
deps << "version-manifest"

dependencies deps

exclude "\.git*"
exclude "bundler\/git"
