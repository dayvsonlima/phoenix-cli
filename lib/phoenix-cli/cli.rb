require 'thor'
require 'active_support/inflector'
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

    desc "migrate", "Run ecto migrations"
    def migrate
      exec("mix ecto.migrate")
    end

    desc "generate", "Run generators"
    def generate(generator, resource_name, *args)
      if generator == 'scaffold'
        commands = args.join(' ')
        exec("mix phoenix.gen.html #{resource_name.camelize} #{resource_name.pluralize} #{commands}")
      end
    end

    desc "routes", "Show phoenix routes"
    def routes
      exec("mix phoenix.routes")
    end

    desc 'version', 'phoenix-cli version'
    def version
      puts PhoenixCli::VERSION
    end
  end
end
