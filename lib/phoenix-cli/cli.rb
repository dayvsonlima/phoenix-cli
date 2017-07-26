require 'thor'
require 'active_support/inflector'
require 'phoenix-cli'

trap("SIGINT") { exit! }

module PhoenixCli
  class CLI < Thor
    include Thor::Actions

    map %w(-v --version) => :version
    map %w(db:drop) => :db_drop
    map %w(db:migrate) => :db_migrate
    map %w(db:create) => :db_create
    map %w(db:dump) => :db_dump

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
    def generate(*commands)
      generator = commands[0]
      resource = commands[1]
      attributes = commands[2..(commands.length - 1)]

      resource_camelized = resource.camelize
      resource_pluralized = resource.pluralize

      if ['scaffold', 'html', 'resource'].include? generator
        exec("mix phoenix.gen.html #{resource_camelized} #{resource_pluralized} #{attributes.join(' ')}")
      end

      if ['json', 'api'].include? generator
        exec("mix phoenix.json #{resource_camelized} #{resource_pluralized} #{attributes.join(' ')}")
      end

      if ['channel', 'presence', 'secret', 'digest'].include? generator
        exec("mix phoenix.gen.#{generator} #{attributes.join(' ')}")
      end

      if ['model'].include? generator
        exec("mix phoenix.gen.#{generator} #{resource_camelized} #{resource_pluralized} #{attributes.join(' ')}")
      end
    end

    desc "routes", "Show phoenix routes"
    def routes
      exec("mix phoenix.routes")
    end

    desc "db:create", "Create database"
    def db_create
      exec("mix ecto.create")
    end

    desc "db:migrate", "Run database migrations"
    def db_migrate
      exec("mix ecto.migrate")
    end

    desc "db:drop", "Drop database"
    def db_drop
      exec("mix ecto.drop")
    end

    desc "db:dump", "Dumps the current environment’s database"
    def db_dump
      exec("mix ecto.dump")
    end

    desc 'version', 'phoenix-cli version'
    def version
      puts PhoenixCli::VERSION
    end
  end
end
