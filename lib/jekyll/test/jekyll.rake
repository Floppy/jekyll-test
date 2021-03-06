# frozen_string_literal: true

require "html-proofer"

def default_options
  {
    assume_extension: ".html",
    typhoeus: {
      ssl_verifypeer: false,
      ssl_verifyhost: 0,
      timeout: 3
    }
  }
end

def check_site(options = {})
  HTMLProofer.check_directory(
    jekyll_site_directory,
    default_options.merge(options)
  ).run
end

def jekyll_config
  File.exist?("_config.yml") ? YAML.load_file("_config.yml") : {}
end

def jekyll_site_directory
  jekyll_config["destination"] || "./_site"
end

def baseurl
  jekyll_config["baseurl"] || ""
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
      check_sri: true,
      check_img_http: true,
      check_opengraph: true,
      disable_external: true,
      url_swap: {
        /^#{baseurl}/ => ""
      }
    )
  end

  task check_external_links: :rebuild do
    check_site(
      url_ignore: [],
      check_external_hash: true
    )
  end
end
