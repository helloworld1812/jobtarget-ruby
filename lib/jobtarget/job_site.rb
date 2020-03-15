module Jobtarget
  class JobSite

    class << self

      # Job Site Lookup - /api/employer/jobsites/lookup
      # params
      #   token - the user token that must be passed to authenticate API access
      #   search - keyword to search job site name
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "search": "nurse"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - Message related to the Status
      #   site_id – the unique id in OneClick for the job site
      #   site_name – name of the job site
      #   niche – category of the job site
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "sites": [
      #       {
      #         "site_id": 7131,
      #         "site_name": "American College of Nurse-Midwives - Midwifejobs.com",
      #         "niche": "Nursing"
      #       }
      #     ]
      #   }
      def lookup(opts = {})
        path = '/api/employer/jobsites/lookup'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Site Info - /api/employer/jobsites/getsiteinfo
      # params
      #   token - the user token that must be passed to authenticate API access
      #   site_id - OneClick's ID for the job site you are requesting information for
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "site_id": 763
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   site_name – the name of the job site
      #   site_description – the description of the job site
      #   site_url – the URL of the job site
      #   site_id – the ID number for this job site in OneClick
      #   product_id – the ID number for this product in OneClick
      #   product_name – the name of the product
      #   product_duration – the number of days the posting would be live on the job site
      #   product_price – the cost of the product on the job site
      #   product_discount_price – the gross cost/discounted price of the product
      #   is_default – 1 indicates this is the default product we present for this job site in OneClick
      #   is_quote – 1 indicates that this product requires we get a price quote
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "site_name": "Monster.com",
      #     "site_url": "http://www.monster.com",
      #     "products": [{
      #                    "site_id": 763,
      #                    "product_id": 65769,
      #                    "product_name": "30 Day Job Posting",
      #                    "product_duration": 31,
      #                    "product_price": 249,
      #                    "product_discount_price": 225,
      #                    "is_default": 1,
      #                    "is_quote": 0,
      #                    "agency_net_product_price": 211.65
      #                  }],
      #     "custom_data": [{
      #                       "name": "name",
      #                       "displayName": "Job Name",
      #                       "id": 3394188,
      #                       "questionid": 9,
      #                       "type": "text",
      #                       "displayTypeOptions": [],
      #                       "validation": [{
      #                                        "type": "isRequired",
      #                                        "enforcementContext": ["manual"]
      #                                      }, {
      #                                        "type": "maxLength",
      #                                        "lengthType": "characters",
      #                                        "value": 150
      #                                      }],
      #                       "displayOptions": null
      #                     }]
      #   }
      def get(opts = {})
        path = '/api/employer/jobsites/getsiteinfo'
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