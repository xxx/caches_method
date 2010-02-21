caches_method
=============

An quick 'n' dirty ActiveRecord plugin to easily handle caching of method results in the Rails cache.

SYNOPSIS
========

    class AwesomeThing < ActiveRecord::Base
      def slow_method
        # do slow stuff.
      end
  
      caches_method :slow_method

      # extra args are passed to Rails.cache.write, e.g.
      # caches_method :slow_method, :expires_in => 30.minutes
    end


REQUIREMENTS
============

Rails.

Rails caching set up.

INSTALLATION
============

    sudo gem install caches_method

then in your environment.rb:
    config.gem 'caches_method', :source => 'http://rubygems.org'
    
TODO
====

Write specs.

Handle arguments better. Swiping code from Rails memoization may be the fastest way to this.

LICENSE
=======

See the LICENSE FILE included in this distribution.
