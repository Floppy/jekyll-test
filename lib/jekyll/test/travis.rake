# frozen_string_literal: true

namespace :jekyll do
  namespace :configure do
    task :travis do
      # Initialise travis
      sh "bundle exec travis init" unless File.exist?(".travis.yml")
      # Load existing configuration
      travis = {}
      travis = YAML.load_file(".travis.yml")
      # Update configuration
      travis["rvm"] = ["2.4.3"]
      travis["sudo"] = false
      travis["cache"] = "bundler"
      travis["addons"] = {
        "apt" => {
          "packages" => [
            "libcurl4-openssl-dev"
          ]
        }
      }
      travis["env"] = [
        %(TASK='jekyll:check'),
        %(TASK='jekyll:check_external_links')
      ]
      travis["matrix"] = {
        "fast_finish" => true,
        "allow_failures" => [{
          "env" => %(TASK='jekyll:check_external_links')
        }]
      }
      travis["script"] = "bundle exec rake $TASK"
      # Output
      File.write(".travis.yml", travis.to_yaml)
    end
  end
end
