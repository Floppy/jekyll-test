require 'html-proofer'

def check_site(options = {})
  defaults = {
    assume_extension: ".html",
    typhoeus: {
      ssl_verifypeer: false, 
      ssl_verifyhost: 0,
      timeout: 3,
    }, 
  }
  HTMLProofer.check_directory("./_site", defaults.merge(options)).run
end

namespace :jekyll do

  task :rebuild do
    sh "rm -rf _site"
    sh "bundle exec jekyll build"
  end

  task :check => :rebuild do
    check_site(
      check_html: true, 
      check_favicon: true,
      #check_sri: true, #soon!
      check_img_http: true,
      check_opengraph: true,
      disable_external: true,
    )
  end

  task :check_external_links => :rebuild do
    check_site(
      url_ignore: [],
      check_external_hash: true,
    )
  end
  
end