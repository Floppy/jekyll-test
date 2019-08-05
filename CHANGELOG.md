# Changelog

## 1.3.0

* Run travis builds on 2.6.3

Rerun `rake jekyll:configure:travis` to get the new configuration.

## 1.2.0

* Check SRI tags by default
* Automatically handle sites with non-empty baseurl
* Run travis builds on 2.5.3

Rerun `rake jekyll:configure:travis` to get the new configuration.

## 1.1.1

* Support Ruby 2.5.0
* Update travis builds to run on Ruby 2.4.3 (travis currently has issues with 2.5.0)

Rerun `rake jekyll:configure:travis` to get the new configuration.

## 1.1.0

* Update travis configuration to fix SSL check errors.
* Update travis builds to run on Ruby 2.4.2

Rerun `rake jekyll:configure:travis` to get the new configuration.

## 1.0.0

* Added `jekyll:configure:travis` task to automatically configure travis matrix builds.
* Added jekyll itself as a dependency
* Use correct destination directory for builds and tests

## 0.2.0

* Add Rake tasks to check validity and links.

## 0.1.0

* initial release, pulls in required dependencies for testing.
