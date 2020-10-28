require "dry/cli"

module Modul
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts VERSION
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
    end
  end
end

