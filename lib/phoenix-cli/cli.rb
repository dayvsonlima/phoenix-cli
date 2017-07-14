require 'thor'
require 'phoenix-cli'

trap("SIGINT") { exit! }

module PhoenixCli
  class CLI < Thor
    include Thor::Actions

    map %w(-v --version) => :version

    desc "install", "Install framework"
    def install
      exec('mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez')
    end

    desc "new", "Create new project"
    def new(path='')
      exec("mix phoenix.new #{path}")
    end

    desc "server", "Create new project"
    def server
      exec("mix phoenix.server")
    end

    desc "deps", "Install dependences"
    def deps
      exec("mix deps.get")
    end

    desc "console", "Run phoenix console"
    def console
      exec("iex -S mix")
    end

    desc 'version', 'phoenix-cli version'
    def version
      puts PhoenixCli::VERSION
    end
  end
end
