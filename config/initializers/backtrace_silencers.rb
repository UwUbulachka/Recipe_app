# frozen_string_literal: true

Rails.backtrace_cleaner.add_silencer { |line| line =~ /rvm/ }
