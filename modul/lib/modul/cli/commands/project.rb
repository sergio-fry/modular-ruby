require "dry/cli"

module Modul
  module CLI
    module Commands
      class Project < Dry::CLI::Command
        desc "Generate project"
        argument :name, required: true, desc: "Project name"

        def call(name:, **)
          `mkdir #{name}`
        end
      end

      register "new", Project
    end
  end
end

