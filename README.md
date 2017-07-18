Phoenix-cli
=================

Phoenix Pretty CLI
Use Phoenix Framework with the same friendly rails interface

![Alt Text](screenshot.gif)

## Setup

1. Install `gem install phoenix-cli`.

## Commands List

| Command | Description |
| --- | --- |
| install | Install Phoenix Framework |
| new APP_PATH | Create new Phoenix application |
| deps | Install the Phoenix dependencies |
| server | Start the web server |
| console | Start Phoenix console |
| routes | Show Phoenix routes |
| version | Get current CLI version |


Run `phoenix` for more options


## Development

When hacking on this gem, the REPL `pry` comes in handy. You can load the
contents of the gem with `pry --gem`.

To test the CLI, run

    ruby -Ilib bin/phoenix-cli


## License

Phoenix CLI is released under the [MIT License](http://www.opensource.org/licenses/MIT).
