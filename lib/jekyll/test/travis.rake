namespace :jekyll do

  namespace :configure do
  
    task :travis do
      # Initialise travis
      unless File.exist?(".travis.yml")
        sh "bundle exec travis init"
      end
      # Load existing configuration
      travis = {}
      travis = YAML.load_file(".travis.yml") 
      # Update configuration
      travis["rvm"] = ["2.5.0"]
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
        %Q{TASK='jekyll:check'},
        %Q{TASK='jekyll:check_external_links'},
      ]
      travis["matrix"] = {
        "fast_finish" => true,
        "allow_failures" => [{
          "env" => %Q{TASK='jekyll:check_external_links'}
        }]
      }
      travis["script"] = "bundle exec rake $TASK"
      # Output
      File.write(".travis.yml", travis.to_yaml)
    end
  
  end
  
end
