# Jekyll-Test

`jekyll-test` is a highly opinionated test configuration for Jekyll sites to let you create well-formed sites with minimal configuration.

It provides two rake tasks:

`jekyll:check` will test your site for HTML validity, internal link correctness, alt tags, OpenGraph validity, https usage, and a load more. It will complain about as much as it can. You want this to pass.

`jekyll:check_external_links` will check all outgoing links as well. This is a separate task as this often fails due to network errors, etc, and you don't want to depend on it passing. Use it for information only.

## Usage

Add this line to your site's Gemfile and run `bundle`:

```ruby
group :test do
  gem 'jekyll-test'
end
```

In your Rakefile, then add:

```ruby
require 'jekyll/test/tasks'
```

We suggest making `jekyll:check` your default task by adding this to your Rakefile:

```rake
task default: "jekyll:check"
```

## Coming soon

* travis setup for using these tasks in a CI environment
* spellchecking

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Floppy/jekyll-test. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Jekyll::Test project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-test/blob/master/CODE_OF_CONDUCT.md).