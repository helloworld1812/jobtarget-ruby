module Jobtarget
  class User

    class << self

      # Login User - /api/employer/user/login
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   login_url - the URL to use to SSO the user into OneClick
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "login_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/3e73c826-c282-416e-8568-effae808ede7"
      #   }
      def login(opts = {})
        path = '/api/employer/user/login'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get User Info - /api/employer/user/info
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   user_id – OneClick’s unique ID of the authenticated user
      #   first_name – first name of the authenticated user
      #   last_name – last name of the authenticated user
      #   title – job title of the authenticated user
      #   email – email address of the authenticated user
      #   user_type – the user role as defined in OneClick for the authenticated user
      #   billing_street_address - The billing address
      #   billing_city - The billing city
      #   billing_state - The billing state
      #   billing_zip - The zip code
      #   billing_country - The billing
      #   company_id - The unique company ID in JobTarget
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "user_id": 1001493,
      #     "first_name": "John",
      #     "last_name": "smith111",
      #     "title": "senior recruiter111",
      #     "email": "john.smith111@gmail.com",
      #     "user_type": "Recruiter",
      #     "billing_street_address": "",
      #     "billing_city": "",
      #     "billing_state": "",
      #     "billing_zip": "",
      #     "billing_country": "",
      #     "company_id": "33032"
      #   }
      def info(opts = {})
        path = '/api/employer/user/info'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get User Divisions - /api/employer/user/divisions
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   division_id – the unique ID number for that division in OneClick
      #   name – the name for that division in OneClick
      def divisions(opts = {})
        path = '/api/employer/user/divisions'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get User Credit Cards - /api/employer/user/creditcards
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   managecc_url - URL to use to manage the user's credit cards
      #   cc_id – the unique ID number for that credit card in OneClick
      #   name – the name assocaited with the card
      #   type – the type of card (Visa, Mastercard, Amex etc).
      #   number – the last 4 digits of the card
      #   exp_month – the expiration month the card
      #   exp_year – the expiration year the card
      #   address - the address associated with the credit card
      #   managecc_url
      #   If you wish to add a redirect to this page on the successful addition of a credit card, simply add a url parameter to the query string.
      #
      #   Example:
      #
      #   https://www.jobtarget.com/oc/sso/cc/7abd283d-e86c-4498-a85d-4255f0030729?url=https%3A%2F%2Fwww.google.com
      #
      #   Please ensure that the URL is URL Encoded.
      def credit_cards(opts = {})
        path = '/api/employer/user/creditcards'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Order Information - /api/employer/user/orderinfo
      # params
      #   token - the user token that must be passed to authenticate API access
      #   order_id - the order_id of the order you wish to get information for
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "order_id": "21629440"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   order_item_id - the order item id for the given item
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "order_id": "21629440",
      #     "items": [
      #                 {
      #                   "order_item_id": 43468943,
      #                   "site_id": 29848,
      #                   "site_name": "Minion's Mustard Mansion",
      #                   "start_date": "2019-03-15T00:00:00",
      #                   "cost": "$0.00",
      #                   "product_name": "Recruit Site Posting",
      #                   "posting_id": 108536502,
      #                   "added_date": "2019-03-15T12:01:00"
      #                 }
      #               ],
      #     "taxes_and_fees": 0,
      #     "total": "$0.00"
      #   }
      def order_info(opts = {})
        path = '/api/employer/user/orderinfo'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Order Receipts - /api/employer/user/receipts
      # params
      #   token - the user token that must be passed to authenticate API access
      #   orders - a list of orders you wish to retreive receipts for
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "orders": [21629440, 22370891]
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   receipt_url - the URL to a download a pdf copy of the receipts
      def receipts(opts = {})
        path = '/api/employer/user/receipts'
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