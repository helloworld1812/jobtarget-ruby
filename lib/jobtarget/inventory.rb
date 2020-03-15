module Jobtarget
  class Inventory

    class << self

      # Get Inventory - /api/employer/media/inventory
      # Retrieve all media accounts & inventory associated with this user (via their division access rights) in OneClick.
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   inventory_id – the unique ID number in OneClick for this particular inventory account
      #   site_id – the ID number for the job site
      #   site_name – the name of the job site
      #   inventory_name – the name of the inventory, as given by the user
      #   inventory_type – the type of media/inventory account (membership, subscription, slot, credit)
      #   credits_total – the original amount of credits purchased
      #   credits_available – the number of credits remaining
      #   start_date – the start date of when the inventory may be used
      #   expire_date – the date when the inventory will expire and no longer be used
      #   status – indicates whether the inventory is active, expired, or disabled
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "inventory": []
      #   }
      def query(opts = {})
        path = '/api/employer/media/inventory'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

    end

  end
end