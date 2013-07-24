name "opscode-platform-debug"
version "pc-rel-0.2.11"

dependency "ruby"
dependency "bundler"
dependency "postgresql92"
dependency "rsync"

source :git => "git@github.com:opscode/opscode-platform-debug"

relative_path "opscode-plaform-debug"

orgmapper_dir = "#{project_dir}/orgmapper"

# Need to add PG path to ENV
# TODO: should we just update the ENV in the postgresql.rb instead?
env = ENV.to_hash
env['PATH'] = "#{install_dir}/embedded/postgres/9.2:#{ENV['PATH']}"

build do
  # bundle install orgmapper
  bundle "install --without mysql --path=/opt/opscode/embedded/service/gem", :cwd => orgmapper_dir, :env => env

  command "mkdir -p #{install_dir}/embedded/service/opscode-platform-debug"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./ #{install_dir}/embedded/service/opscode-platform-debug/"
end
