# frozen_string_literal: true

$VERBOSE = nil
Dir["#{File.dirname(__FILE__)}/*.rake"].each { |ext| load ext }
