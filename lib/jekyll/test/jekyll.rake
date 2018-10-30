# frozen_string_literal: true

require "html-proofer"

def check_site(options = {})
  defaults = {
    assume_extension: ".html",
    typhoeus: {
      ssl_verifypeer: false,
      ssl_verifyhost: 0,
      timeout: 3
    }
  }
  HTMLProofer.check_directory(jekyll_site_directory, defaults.merge(options)).run
end

def jekyll_site_directory
  dir = "./_site"
  if File.exist?("_config.yml")
    config = YAML.load_file("_config.yml")
    dir = config["destination"] || dir
  end
  dir
end

namespace :jekyll do
  task :rebuild do
    sh "rm -rf #{jekyll_site_directory}"
    sh "bundle exec jekyll build"
  end

  task check: :rebuild do
    check_site(
      check_html: true,
      check_favicon: true,
      # check_sri: true, #soon!
      check_img_http: true,
      check_opengraph: true,
      disable_external: true
    )
  end

  task check_external_links: :rebuild do
    check_site(
      url_ignore: [],
      check_external_hash: true
    )
  end
end
