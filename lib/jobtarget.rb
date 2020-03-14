require "jobtarget/version"
require 'httparty'
require 'jobtarget/config'
require 'jobtarget/company'

module Jobtarget
  class Error < StandardError; end

  def self.configure(config = {})
    Jobtarget::Config.configure(config)
  end

end

# Alias the module for those looking to use the stylized name JobTarget
JobTarget = Jobtarget