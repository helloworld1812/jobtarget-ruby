module Jobtarget
  class User

    class << self

      # Get User Token - /api/employer/auth/gettoken
      # params
      #   p_token - the partner token/key that must be passed to authenticate API access
      #   email - email address of the user
      #   uid - unique identifier for given user (optional)
      # request
      #   {
      #     "p_token": "P_TOKEN_VALUE",
      #     "email": "john.smith@workstream.is"
      #   }
      # response
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "token": "4958991c-06a7-abcd-aa01-98b3bae42292",
      #     "user": {
      #       "user_id": 1000287,
      #       "first_name": "John",
      #       "last_name": "smith",
      #       "title": "senior recruiter",
      #       "email": "john.smith@workstream.is",
      #       "user_type": "Admin"
      #     }
      #   }
      def auth(opts = {})
        path = '/api/employer/auth/gettoken'
        options = opts.merge(p_token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Create User - /api/employer/user/create
      # params
      #   p_token - the partner token that must be passed to authenticate API access
      #   first_name - first name of the user to be created in OneClick
      #   last_name - last name of the user to be created in OneClick
      #   title - title of the user to be created in OneClick
      #   email - email of the user to be created in OneClick
      #   is_admin - if 1, we will setup the user as an Administrator for their Company in OneClick. If 0, they will be setup as a Recruiter user type without administrative privileges
      #   You must provide either company_id or external_company_id
      #     company_id - the company_id of the company of the new user
      #     external_company_id - or the external_company_id of the company for the new user
      #   external_user_id - this is the unique user ID from your system
      #   billing_street_address - The billing address
      #   billing_city - The billing city
      #   billing_state - The ISO code representing the state. (Find lookup in Reference section)
      #   billing_zip - The zip code
      #   billing_country - The ISO code representing the country. (Find lookup in Reference section)
      # request
      #   {
      #     "p_token": "P_TOKEN_VALUE",
      #     "user": {
      #       "first_name": "John",
      #       "last_name": "smith",
      #       "title": "senior recruiter",
      #       "email": "john.smith@gmail.com",
      #       "is_admin": 0,
      #       "company_id": 0,
      #       "external_user_id": "0"
      #     }
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - Message related to the Status
      #   user_id – the unique OneClick ID number for the newly created user
      #   first_name – first name of the newly created user
      #   last_name – last name of the newly created user
      #   title – job title of the newly created user
      #   email – email address of the newly created user
      #   user_type – the user role as defined in OneClick for the newly created user
      #   company_name – the name of the company associated with this user.
      #   added_date – the date the user was created
      def create(opts = {})
        path = '/api/employer/user/create'
        options = opts.merge(p_token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # User Edit - /api/employer/user/edit
      # params
      #   p_token - the partner token that must be passed to authenticate API access
      #   user_id - the unique user ID in OneClick
      #   first_name - the first name of the user
      #   last_name - the last name of the user
      #   email - email address of the user
      #   is_admin - if 1, we will setup the user as an Administrator for their Company in OneClick. If 0, they will be setup as a Recruiter user type without administrative privileges
      #   is_active - if 1, set the user to active. If 0, set the user to inactive
      #   {
      #     "p_token": "P_TOKEN_VALUE",
      #     "user": {
      #       "first_name": "John",
      #       "last_name": "smith",
      #       "title": "senior recruiter",
      #       "email": "john.smith@gmail.com",
      #       "is_admin": 0,
      #       "company_id": 0,
      #       "external_user_id": "0"
      #     }
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - Message related to the Status
      #   user_id – the unique OneClick ID number for the newly created user
      #   first_name – first name of the newly created user
      #   last_name – last name of the newly created user
      #   title – job title of the newly created user
      #   email – email address of the newly created user
      #   user_type – the user role as defined in OneClick for the newly created user
      #   company_name – the name of the company associated with this user.
      #   is_active - See if a company or user is active/inactive in our system.
      def update(opts = {})
        path = '/api/employer/user/edit'
        options = opts.merge(p_token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

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
      def login(opts = {})
        path = '/api/employer/user/login'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Login User - /api/employer/user/info
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

      # Get Users Via p_token - /api/employer/user/getusersviaptoken
      # params
      #   p_token - the partner token that must be passed to authenticate API access
      #   Optional - either company_id or external_company_id
      #     company_id - the company_id of the company you wish to get ueser for
      #     external_company_id - the external_company_id of the company you wish to get ueser for
      #   {
      #     "p_token": "P_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   user_id - OneClick's unique ID of the authenticated user
      #   first_name - first name of the authenticated user
      #   last_name - last name of the authenticated user
      #   title - job title of the authenticated user
      #   email - email address of the authenticated user
      #   user_type - the user role as defined in OneClick for the authenticated user
      #   external_user_id - this is the unique user ID from your system
      #   billing_street_address - The billing address
      #   billing_city - The billing city
      #   billing_state - The billing state
      #   billing_zip - The zip code
      #   billing_country - The billing country
      #   company_id - The unique company ID in JobTarget
      #   is_active - See if a company or user is active/inactive in our system
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "users": [{
      #                 "user_id": "1000287",
      #                 "first_name": "John",
      #                 "last_name": "smith",
      #                 "title": "senior recruiter",
      #                 "email": "john.smith@workstream.is",
      #                 "user_type": "Admin",
      #                 "external_user_id": "0",
      #                 "billing_street_address": "",
      #                 "billing_city": "",
      #                 "billing_state": "",
      #                 "billing_zip": "",
      #                 "billing_country": "",
      #                 "company_id": "31962",
      #                 "is_active": "True"
      #               }]
      #   }
      def query(opts = {})
        path = '/api/employer/user/getusersviaptoken'
        options = opts.merge(p_token: true)
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