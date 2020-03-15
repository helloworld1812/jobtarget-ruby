module Jobtarget
  class Job

    class << self

      # Create Job - /api/employer/jobs/create
      # params
      #   required fields
      #     token - the user token that must be passed to authenticate API access
      #     requisition_name – this is the unique ID from your system for the client’s job. Usually a requisition number or unique job reference name
      #     company_name – the name of the company to display on the job ads
      #     title – the job title to display on the job ads
      #     description – the job description to display on the job ads
      #     job_view_url – the URL to the webpage on the ATS where a job seeker can read the full job description for this job
      #     apply_url – the URL to the webpage on the ATS where the job seeker would start the application process for this job
      #     city - the city that this position is to be located in
      #     state – the state code representing the state where this job opening is located. (Find lookup in Reference section)
      #     zip - the zip code that this position is to be located in
      #     country – the ISO code representing the country where this job opening is located. (Find lookup in Reference section)
      #   optional fields
      #     product_id – Can be used to automatically add products to the shopping cart in OneClick. This is the ID number for the product in OneClick. Supports comma delimited lists
      #     division_id – the ID for the division folder where the job should be placed
      #     experience – the number of years' experience necessary for the job opening (Find lookup in Reference section)
      #     jobfunction – the OneClick ID representing the closest job function for this position. (Find lookup in Reference section)
      #     industry - the OneClick ID representing the closest industry for this position (Find lookup in Reference section)
      #     job_type - the status of employment (full time, part time, etc) (Find lookup in Reference section)
      #     requirements - the job requirements to be display on the job ads
      #     duration - the duration of employment of this opening (Find lookup in Reference section)
      #     travel - the amount of travel required for this position (Find lookup in Reference section)
      #     education - the minimum education requirement for this position (Find lookup in Reference section)
      #     salary_low - the low end dollar amount of this position's salary
      #     salary_high - the high end dollar amount of this position's salary
      #     salary_type - the salary type for the provided low and high salary (Find lookup in Reference section)
      #     contact_name - name of the contact person candidates will reach out to and will be displayed on job ads
      #     contact_email - email of the contact person candidates will reach out to and will be displayed on job ads
      #     contact_phone - contact phone number of the person candidates will reach out to and will be displayed on job ads
      #     contact_ext - contact extension of the person candidates will reach out to and will be displayed on job ads
      #     entrylevel - indicates whether the job is entry-level. (1 = yes, 0 = no)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job": {
      #       "requisition_name": "my-new-job",
      #       "company_name": "ABC Corp",
      #       "title": "SQL DBA",
      #       "description": "you have to do dba stuff and work with devs",
      #       "jobfunction": 65,
      #       "job_view_url": "http://www.jobview.com/position/12345",
      #       "apply_url": "http://www.applyhere.com/234",
      #       "location": {
      #         "city": "Groton",
      #         "state": "CT",
      #         "country": "US",
      #         "zip": "06340"
      #       }
      #     }
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   job_manage_url – the URL to use to SSO the user into OneClick and land them on this job to manage it
      #   job_post_url – the URL to use to SSO the user into OneClick and land them on the job to post it to job sites
      #   job_division_url - the URL to use to SSO the user into OneClick and land them on the division selection page
      #   job_cart_url – the URL to use to SSO the user into OneClick and land them in the shopping cart, pre-filled with the products passed in.
      #   job_id – the unique ID in OneClick for this job
      #   apply_url - the URL to the webpage on the ATS where the job seeker would start the application process for this job
      #   city – the name of the city where the job opening is located
      #   company – the name of the company with the job opening
      #   contact_email – the email address to display in the ads, if the advertiser wants to receive applications by email
      #   contact_ext – the extension to the phone number to display in the ads, if the advertiser wants to receive phone calls from applicants
      #   contact_name – the contact person to display in the ads, if the advertiser wants to direct applicants to a particular person
      #   contact_phone – the phone number to display in the ads, if the advertiser wants to have applicants call in
      #   country – the name of the country where the job opening is located
      #   description – the job description/advertisement
      #   duration – the duration of the job, if temporary
      #   education – the minimum education required for the job opening
      #   entrylevel – tndicates whether the job is entry-level
      #   experience – the number of years’ experience necessary for the job opening
      #   function – the job function categorization of the job opening
      #   industry – the industry that the job opening operates in
      #   job_type – the type of job opening it is (full-time, temporary, contract, etc.)
      #   requisition_name – the unique requisition number or job reference name in the ATS
      #   position – the job title for the job opening
      #   requirements – the description of the job requirements for this job opening
      #   salary_high – the high range number for the salary
      #   salary_low – the low range number for the salary
      #   salary_type – the type of salary (hourly or annual), as it relates to the salary range
      #   state – the name of the state/province where the job opening is located
      #   travel – the amount of travel necessary for the job opening
      #   zip – the zip/postal code for where the job opening is located
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #     "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #     "job_division_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/division/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #     "marketplace_iframe": "https://jtbosocwebuat01.jobtarget.com/oc/sso/partner/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #     "job_id": 26735281,
      #     "job": {
      #       "apply_url": "http://www.applyhere.com/234",
      #       "city": "Groton",
      #       "company": "ABC Corp",
      #       "contact_email": "",
      #       "contact_ext": "",
      #       "contact_name": "",
      #       "contact_phone": "",
      #       "country": "United States",
      #       "description": "you have to do dba stuff and work with devs",
      #       "duration": "",
      #       "education": "",
      #       "entrylevel": "0",
      #       "experience": "",
      #       "function": "Manufacturing",
      #       "industry": "",
      #       "job_type": "",
      #       "requisition_name": "my-new-job1",
      #       "position": "SQL DBA",
      #       "requirements": "",
      #       "salary_high": "",
      #       "salary_low": "",
      #       "salary_type": "",
      #       "state": "Connecticut",
      #       "travel": "",
      #       "zip": "06340",
      #       "location": [
      #                      {
      #                        "city": "Groton",
      #                        "state": "Connecticut",
      #                        "zip": "06340",
      #                        "country": "United States"
      #                      }
      #                    ]
      #     }
      #   }
      def create(opts = {})
        path = '/api/employer/jobs/create'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Edit Job/Postings - /api/employer/jobs/edit
      # params
      #   Required Fields
      #     token - the user token that must be passed to authenticate API access
      #     job_id – this is the job_id of the job you which to edit
      #     company_name – the name of the company to display on the job ads
      #     title – the job title to display on the job ads
      #     description – the job description to display on the job ads
      #     jobfunction – the OneClick ID representing the closest job function for this position. (Find lookup in Reference section)
      #     job_view_url – the URL to the webpage on the ATS where a job seeker can read the full job description for this job
      #     apply_url – the URL to the webpage on the ATS where the job seeker would start the application process for this job
      #     city - the city that this position is to be located in
      #     state – the state code representing the state where this job opening is located. (Find lookup in Reference section)
      #     zip - the zip code that this position is to be located in
      #     country – the ISO code representing the country where this job opening is located. (Find lookup in Reference section)
      #   Optional Fields
      #     product_id – Can be used to automatically add products to the shopping cart in OneClick. This is the ID number for the product in OneClick. Supports comma delimited lists
      #     division_id – the ID for the division folder where the job should be placed
      #     experience – the number of years' experience necessary for the job opening (Find lookup in Reference section)
      #     jobfunction – the OneClick ID representing the closest job function for this position. (Find lookup in Reference section)
      #     industry - the OneClick ID representing the closest industry for this position (Find lookup in Reference section)
      #     job_type - the status of employment (full time, part time, etc) (Find lookup in Reference section)
      #     requirements - the job requirements to be display on the job ads
      #     duration - the duration of employment of this opening (Find lookup in Reference section)
      #     travel - the amount of travel required for this position (Find lookup in Reference section)
      #     education - the minimum education requirement for this position (Find lookup in Reference section)
      #     salary_low - the low end dollar amount of this position's salary
      #                                                                                                                                   salary_high - the high end dollar amount of this position's salary
      #     salary_type - the salary type for the provided low and high salary (Find lookup in Reference section)
      #     contact_name - name of the contact person candidates will reach out to and will be displayed on job ads
      #     contact_email - email of the contact person candidates will reach out to and will be displayed on job ads
      #     contact_phone - contact phone number of the person candidates will reach out to and will be displayed on job ads
      #     contact_ext - contact extension of the person candidates will reach out to and will be displayed on job ads
      #     entrylevel - indicates whether the job is entry-level. (1 = yes, 0 = no)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job": {
      #       "job_id": "24133634",
      #       "company_name": "ABC Corp",
      #       "title": "SQL DBA",
      #       "description": "you have to do dba stuff and work with devs",
      #       "jobfunction": 65,
      #       "job_view_url": "http://www.jobview.com/position/12345",
      #       "apply_url": "http://www.applyhere.com/234",
      #       "location": {
      #         "city": "Groton",
      #         "state": "CT",
      #         "country": "US",
      #         "zip": "06340"
      #       }
      #     }
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   job_manage_url – the URL to use to SSO the user into OneClick and land them on this job to manage it
      #   job_post_url – the URL to use to SSO the user into OneClick and land them on the job to post it to job sites
      #   job_cart_url – the URL to use to SSO the user into OneClick and land them in the shopping cart, pre-filled with the products passed in.
      #   job_id – the unique ID in OneClick for this job
      #   apply_url - the URL to the webpage on the ATS where the job seeker would start the application process for this job
      #   city – the name of the city where the job opening is located
      #   company – the name of the company with the job opening
      #   contact_email – the email address to display in the ads, if the advertiser wants to receive applications by email
      #   contact_ext – the extension to the phone number to display in the ads, if the advertiser wants to receive phone calls from applicants
      #   contact_name – the contact person to display in the ads, if the advertiser wants to direct applicants to a particular person
      #   contact_phone – the phone number to display in the ads, if the advertiser wants to have applicants call in
      #   country – the name of the country where the job opening is located
      #   description – the job description/advertisement
      #   duration – the duration of the job, if temporary
      #   education – the minimum education required for the job opening
      #   entrylevel – tndicates whether the job is entry-level
      #   experience – the number of years’ experience necessary for the job opening
      #   function – the job function categorization of the job opening
      #   industry – the industry that the job opening operates in
      #   job_type – the type of job opening it is (full-time, temporary, contract, etc.)
      #   requisition_name – the unique requisition number or job reference name in the ATS
      #   position – the job title for the job opening
      #   requirements – the description of the job requirements for this job opening
      #   salary_high – the high range number for the salary
      #   salary_low – the low range number for the salary
      #   salary_type – the type of salary (hourly or annual), as it relates to the salary range
      #   state – the name of the state/province where the job opening is located
      #   travel – the amount of travel necessary for the job opening
      #   zip – the zip/postal code for where the job opening is located
      def update(opts = {})
        path = '/api/employer/jobs/edit'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get User Jobs - /api/employer/jobs/userjobs
      # params
      #   token - the user token that must be passed to authenicate API access
      #   days - how far back (in days) you wish to retrieve jobs (based upon last updated date)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "days": 60
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
      #     "jobs": [
      #                 {
      #                   "job_id": 26735281,
      #                   "requisition_name": "my-new-job1",
      #                   "position": "SQL DBA",
      #                   "division_id": 1000286,
      #                   "division_name": "Imported Jobs",
      #                   "updated_date": "2020-03-14T09:45:00",
      #                   "created_date": "2020-03-14T09:45:00",
      #                   "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #                   "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #                   "marketplace_iframe": "https://jtbosocwebuat01.jobtarget.com/oc/sso/partner/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281"
      #                 }
      #               ]
      #   }
      def query(opts = {})
        path = '/api/employer/jobs/userjobs'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Job Details / Postings - /api/employer/jobs/jobdetails
      # params
      #   token - the user token that must be passed to authenicate API access
      #     This function requires either job_id or requisition_name
      #   job_id - OneClick’s unique id number for the job
      #   requisition_name - this is the unique ID from your system for the client’s job. Usually a requisition number or unique job reference name
      #   Optional Parameters
      #     exclude_postings - set this to 1 to exclude pulling posting data (optional)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job_id": 24133634
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   job_id – JobTarget’s unique Job ID
      #   job_manage_url – the URL to use to SSO the user into OneClick and land them on this job to manage it
      #   job_post_url – the URL to use to SSO the user into OneClick and land them on the job to post it to job sites
      #   job_analytics – job-level performance
      #   views – the aggregate count of views the job received on the job sites
      #   visits – the aggregate count of visits delivered to the ATS for the job
      #   apps – the aggregate count of applications delivered from the job sites
      #   interviews – the aggregate count of interviews created from the applicants
      #   hires – the aggregate count of hires created from the applicants
      #   apply_url - the URL to the webpage on the ATS where the job seeker would start the application process for this job
      #   city – the name of the city where the job opening is located
      #   company – the name of the company with the job opening
      #   contact_email – the email address to display in the ads, if the advertiser wants to receive applications by email
      #   contact_ext – the extension to the phone number to display in the ads, if the advertiser wants to receive phone calls from applicants
      #   contact_name – The contact person to display in the ads, if the advertiser wants to direct applicants to a particular person
      #   contact_phone – The phone number to display in the ads, if the advertiser wants to have applicants call in
      #   country – the name of the country where the job opening is located
      #   description – the job description/advertisement
      #   duration – the duration of the job, if temporary
      #   education – the minimum education required for the job opening
      #   entrylevel – indicates whether the job is entry-level
      #   experience – the number of years’ experience necessary for the job opening
      #   function – the job function categorization of the job opening
      #   industry – the industry that the job opening operates in
      #   job_type – the type of job opening it is (full-time, temporary, contract, etc.)
      #   requisition_name – the unique requisition number or job reference name in the ATS
      #   position – the job title for the job opening
      #   requirements – the description of the job requirements for this job opening
      #   salary_high – the high range number for the salary
      #   salary_low – the low range number for the salary
      #   salary_type – the type of salary (hourly or annual), as it relates to the salary range
      #   state – the name of the state/province where the job opening is located
      #   travel – the amount of travel necessary for the job opening
      #   zip – the zip/postal code for where the job opening is located
      #   posting_id – the unique id in OneClick for this posting. Please note that a posting is a unique instance of a job listed on a job site
      #   site_id – the OneClick id for the job site related to this posting
      #   site_name – the name of the job site related to this posting
      #   status – the current delivery status of the posting to the job site. List of statuses and their meanings can be found here.
      #   ordered_date – the date the posting was ordered
      #   expired_date – the date the posting will expire on the job site
      #   view_url – the URL to view the job on the job site (if posting still active)
      #   product_id – the OneClick id for the product related to this posting
      #   analytics – posting-level performance analytics
      #   views – the aggregate count of views the job received for this posting
      #   visits – the aggregate count of visits delivered to the ATS for this posting
      #   apps – the aggregate count of applications delivered from this job posting
      #   interviews – the aggregate count of interviews created from the applicants of this job posting
      #   hires – the aggregate count of hires created from the applicants of this job posting
      def get(opts = {})
        path = '/api/employer/jobs/jobdetails'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Stop Job - /api/employer/jobs/stopjob
      # params
      #   token - the user token that must be passed to authenicate API access
      #   job_id - OneClick’s unique id number for the job you wish to stop
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job_id": 24133634
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      def stop(opts = {})
        path = '/api/employer/jobs/stopjob'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get User Division Jobs - /api/employer/jobs/userdivisionjobs
      # params
      #   token - the user token that must be passed to authenicate API access
      #   days - how far back (in days) you wish to retrieve jobs (based upon last updated date)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "days": 60
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
      #     "marketplace_iframe": "https://jtbosocwebuat01.jobtarget.com/oc/sso/partner/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733416",
      #     "jobs": [
      #                 {
      #                   "job_id": 26735281,
      #                   "requisition_name": "my-new-job1",
      #                   "position": "SQL DBA",
      #                   "division_id": 1000286,
      #                   "division_name": "Imported Jobs",
      #                   "updated_date": "2020-03-14T09:45:00",
      #                   "created_date": "2020-03-14T09:45:00",
      #                   "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281",
      #                   "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26735281"
      #                 },
      #                 {
      #                   "job_id": 26733560,
      #                   "requisition_name": "my-new-job-2",
      #                   "position": "SQL DBA",
      #                   "division_id": 1000286,
      #                   "division_name": "Imported Jobs",
      #                   "updated_date": "2020-02-24T16:17:00",
      #                   "created_date": "2020-02-24T16:17:00",
      #                   "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733560",
      #                   "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733560"
      #                 },
      #                 {
      #                   "job_id": 26733416,
      #                   "requisition_name": "my-new-job",
      #                   "position": "SQL DBA",
      #                   "division_id": 1000286,
      #                   "division_name": "Imported Jobs",
      #                   "updated_date": "2020-02-20T17:21:00",
      #                   "created_date": "2020-02-20T17:21:00",
      #                   "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733416",
      #                   "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733416"
      #                 }
      #               ]
      #   }
      def division_jobs(opts = {})
        path = '/api/employer/jobs/userdivisionjobs'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Create Posting - /api/employer/jobs/createposting
      # params
      #   token - the user token that must be passed to authenicate API access
      #   job_id - OneClick’s unique id number for the job whose posting you wish to stop
      #   cc_id - the credit card id you wish to use to pay for the transaction (if paying by invoice simply use invoice as the cc_id)
      #   site_id - the id of the site to where you want to post the job
      #   product_id - OneClick’s unique id number for the product you want to use
      #   inventory_id - OneClick’s unique id number for the inventory you want to use (optional)
      #   name - the custom field name for the job post (I will provide a function to display the fields)
      #   value - the value corresponing to the named field
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job_id": 24522268,
      #     "cc_id": "invoice",
      #     "postings": [
      #                {
      #                  "site_id": "2149",
      #                  "product_id": "18877",
      #                  "posting_data": [
      #                               {
      #                                 "name": "state",
      #                                 "value": "121"
      #                               }
      #                             ]
      #                },
      #                {
      #                  "site_id": "763",
      #                  "product_id": "65769",
      #                  "inventory_id": "10",
      #                  "posting_data": [
      #                               {
      #                                 "name": "position",
      #                                 "value": "Developer"
      #                               },
      #                             ]
      #                }
      #              ]
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   order_id - the order id that is generated for the postings
      #   order_date - the date of the order
      #   is_order_paid - indicates if the order is paid or not
      #
      #   posting
      #   status - 0 indicates success. Anything else indicates an issue
      #   posting_id -the generated posting id
      #   order_item_id - the generated order item id for the given posting
      #   cost - the cost associated with the posting
      #   site_name - the name of the site
      #   product_id - OneClick’s unique id number for the product you want to use
      #   product_name - the name of the product
      #   product_duration - the number of days the posting will be active on the chosen site
      #   payment_type - the method of payment
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "order_id": 22431920,
      #     "order_date": "3/14/2020 10:09:44 AM",
      #     "is_order_paid": false,
      #     "postings": [
      #                 {
      #                   "status": 0,
      #                   "posting_id": 118182310,
      #                   "order_item_id": 53280176,
      #                   "cost": 335,
      #                   "site_name": "ALLRetailJobs.com",
      #                   "product_id": 18877,
      #                   "product_name": "AllRetailJobs.com",
      #                   "product_duration": 60,
      #                   "payment_type": "creditcard"
      #                 },
      #                 {
      #                   "status": 0,
      #                   "posting_id": 118182311,
      #                   "order_item_id": 53280177,
      #                   "cost": 225,
      #                   "site_name": "Monster.com",
      #                   "product_id": 65769,
      #                   "product_name": "30 Day Job Posting",
      #                   "product_duration": 31,
      #                   "payment_type": "creditcard"
      #                 }
      #               ]
      #   }
      def create_posting(opts = {})
        path = '/api/employer/jobs/createposting'
        options = opts.merge(token: true)
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Stop Posting - /api/employer/jobs/stopposting
      # params
      #   token - the user token that must be passed to authenicate API access
      #   job_id - OneClick’s unique id number for the job whose posting you wish to stop
      #   posting_id - OneClick’s unique id number for the job posting you wish to stop
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job_id": 23890721,
      #     "posting_id": "92825507"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   {
      #     "status": 0,
      #     "message": "success",
      #   }
      def stop_posting(opts = {})
        path = '/api/employer/jobs/stopposting'
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