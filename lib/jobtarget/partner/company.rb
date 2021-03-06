module Jobtarget
  module Partner
    class Company

      class << self

        # Create
        # params
        #   p_token - the partner token/key that must be passed to authenticate API access
        #   name - this is the name of the company you are creating
        #   external_company_id - the ID of the company in your ATS system (number)
        #   billing_street_address - The billing address
        #   billing_city - The billing city
        #   billing_state - The ISO code representing the state. (Find lookup in Reference section)
        #   billing_zip - The zip code
        #   billing_country - The ISO code representing the country. (Find lookup in Reference section)
        #   Optional
        #   industry_id - the OneClick ID representing the closest industry for the new company. (Find lookup in Reference section)
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "name": "Workstream Gem API",
        #     "external_company_id": "",
        #     "billing_street_address": "123 Main St",
        #     "billing_city": "San Francisco",
        #     "billing_state": "California",
        #     "billing_zip": "94016",
        #     "billing_country": "United States",
        #     "is_active": "True",
        #     "tracking_pixel": "https://www.click2apply.net/a/c/GwzG"
        #   }
        # response
        #   error code TODO qiwenlong check the error code for this request
        #   1 = There was an error in processing your request.
        #   2 = There was an error in processing your request - invalid token.
        #   6 = there was an error in processing your request - name cannot be blank.
        #   7 = There was an error in processing your request - channel_site_id not setup correctly (please notify JobTarget).
        #   8 = There was an error in processing your request - external_company_id is required.
        #   9 = There was an error in processing your request - external_company_id must be unique.
        def create(opts = {})
          path = '/api/employer/company/create'
          options = opts.merge(p_token: true)
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Get Companies Via p_token - /api/employer/company/getcompaniesviaptoken
        # params
        #   p_token - the p_token that is used to authenticate API access
        #   external_company_id - external company id of company you want returned (optional)
        #   {
        #     "p_token": "P_TOKEN_VALUE"
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the Status.
        #   company_id – the unique ID number for that company in OneClick
        #   name – the name for that companu in OneClick
        #   external_company_id – the external company id (usually your ATS id for that company)
        #   billing_street_address - The billing address
        #   billing_city - The billing city
        #   billing_state - The billing state
        #   billing_zip - The zip code
        #   billing_country - The billing country
        #   is_active - See if a company or user is active/inactive in our system
        #   tracking_pixel – Unique Tracking Pixel for the company
        #   {
        #     "status": 0,
        #     "message": "success",
        #     "companies": [{
        #                   "company_id": 12844,
        #                   "name": "Workstream Test Company - TEST ACCOUNT",
        #                   "external_company_id": "",
        #                   "billing_street_address": "123 Main St",
        #                   "billing_city": "San Francisco",
        #                   "billing_state": "California",
        #                   "billing_zip": "94016",
        #                   "billing_country": "United States",
        #                   "is_active": "True",
        #                   "tracking_pixel": "https://www.click2apply.net/a/c/GwzG"
        #                 }]
        #   }
        def query(opts = {})
          path = '/api/employer/company/getcompaniesviaptoken'
          options = { params: opts[:params] || {}, p_token: true }
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Get Companies Jobs p_token- /api/employer/company/getcompanyjobsviaptoken
        # params
        #   p_token - the p_token that is used to authenticate API access
        #   company_id - the id of the company whose jobs you wish to retrievce
        #   days - how far back (in days) you wish to retrieve jobs (based upon last updated date)
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "company_id": 31962,
        #     "days": 30
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the status
        #   job_id – JobTarget’s unique Job ID
        #   requisition_name – this is the unique ID from your system for the client’s job. Usually a requisition number or unique job reference name
        #   position – this is the job title
        #   division_id – this is the ID of the OneClick division folder the job belongs to
        #   division_name – this is the name of the OneClick division folder the job belongs to
        #   updated_date – date/time stamp of when the job was last updated in OneClick
        #   created_date – date/time stamp of when job was created in OneClick
        #   job_manage_url – the URL to use to Single Sign On (SSO) the user into OneClick and land them on this job to manage it
        #   job_post_url – the URL to use to SSO the user into OneClick and land them on the job to post it to job sites
        #   {
        #     "status": 0,
        #     "message": "success",
        #     "jobs": [{
        #                   "job_id": 26733560,
        #                   "requisition_name": "my-new-job-2",
        #                   "position": "SQL DBA",
        #                   "division_id": 1000286,
        #                   "division_name": "Imported Jobs",
        #                   "updated_date": "2020-02-24T16:17:00",
        #                   "created_date": "2020-02-24T16:17:00",
        #                   "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit//26733560",
        #                   "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post//26733560"
        #             }]
        #   }
        def jobs(opts = {})
          path = '/api/employer/company/getcompanyjobsviaptoken'
          options = { params: opts[:params] || {}, p_token: true }
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Create Company Feed URL p_token - /api/employer/company/createcompanyfeedurlviaptoken
        # params
        #   p_token - the p_token that is used to authenticate API access
        #   feed_url - the XML/RSS feed url of the company where jobs are being hosted
        #   Optional
        #   company_id - the jobTarget’s unique ID for the new company
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "feed_url": "feed_url"
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the status
        #   channel_site_id – jobTarget’s channel site id
        #   company_id – jobTarget’s unique ID for the new company
        #   url - the XML/RSS feed url of the company where jobs are being hosted
        #   created_date – date/time stamp of when the feed_url added
        def create_feed_url(opts = {})
          path = '/api/employer/company/createcompanyfeedurlviaptoken'
          options = { params: opts[:params] || {}, p_token: true }
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Update Company Feed URL p_token - /api/employer/company/updatecompanyfeedurlviaptoken
        # params
        #   p_token - the p_token that is used to authenticate API access
        #   company_id - the jobTarget’s unique ID for the new company
        #   feed_url - the XML/RSS feed url of the company where jobs are being hosted
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "company_id": "company_id",
        #     "feed_url": "feed_url"
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the status
        #   channel_site_id – jobTarget’s channel site id
        #   company_id – jobTarget’s unique ID for the new company
        #   url – the XML/RSS feed url of the company where jobs are being hosted
        #   is_active – See if a company feed is active/inactive in our system.
        #   created_date – date/time stamp of when the feed_url added
        def update_feed_url(opts = {})
          path = '/api/employer/company/updatecompanyfeedurlviaptoken'
          options = { params: opts[:params] || {}, p_token: true }
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Get Company Feed URL p_token - /api/employer/company/getcompanyfeedurlviaptoken
        # params
        #   p_token - the p_token that is used to authenticate API access
        #   company_id - the jobTarget’s unique ID for the new company
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "company_id": "company_id"
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the status
        #   company_id – jobTarget’s unique ID for the new company
        #   feed_url – Company's feed url.
        #   is_active – See if a company feed is active/inactive in our system.
        #   created_date – date/time stamp of when the feed_url added
        def get_feed_url(opts = {})
          path = '/api/employer/company/getcompanyfeedurlviaptoken'
          options = { params: opts[:params] || {}, p_token: true }
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

      end

    end
  end
end