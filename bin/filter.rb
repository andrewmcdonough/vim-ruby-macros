#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/service_expander.rb"

puts ServiceExpander.new(input: ARGF.read).call
