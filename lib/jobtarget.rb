require "jobtarget/version"
require 'httparty'
require 'jobtarget/config'
require 'jobtarget/partner/company'
require 'jobtarget/partner/job'
require 'jobtarget/partner/user'
require 'jobtarget/company'
require 'jobtarget/job_site'
require 'jobtarget/job'
require 'jobtarget/user'
require 'jobtarget/inventory'

module Jobtarget
  class Error < StandardError; end

  def self.configure(config = {})
    Jobtarget::Config.configure(config)
  end

end

# Alias the module for those looking to use the stylized name JobTarget
JobTarget = Jobtarget