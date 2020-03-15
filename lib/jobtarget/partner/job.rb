module Jobtarget
  module Partner
    class Job

      class << self

        # Get Job Details via p_token- /api/employer/jobs/jobdetailsviaptoken
        # params
        #   p_token - the partner token/key that must be passed to authenticate API access
        #   This function requires either job_id or requisition_name
        #     job_id - OneClick’s unique id number for the job
        #     requisition_name - this is the unique ID from your system for the client’s job. Usually a requisition number or unique job reference name
        #   Optional Parameters
        #     company_id - the company_id associated with the job (optional)
        #     exclude_postings - set this to 1 to exclude pulling post
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "requisition_name": "ABC 123"
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the Status
        #   job_id – JobTarget’s unique Job ID
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
          path = '/api/employer/jobs/jobdetailsviaptoken'
          options = opts.merge(p_token: true)
          response = Jobtarget::Connection.post_json(path, options)
          puts '-----------get response start-------------------'
          puts response
          puts '-----------get response end-------------------'
          response
        end

        # Stop Job Via p_token- /api/employer/jobs/stopjobviaptoken
        # params
        #   p_token - the p_token that is used to authenicate API access
        #   job_id - OneClick’s unique id number for the job you wish to stop
        #   {
        #     "p_token": "P_TOKEN_VALUE",
        #     "job_id": 24133634
        #   }
        # response
        #   status - 0 indicates success. Anything else indicates an issue
        #   message - message related to the Status
        def stop(opts = {})
          path = '/api/employer/jobs/stopjobviaptoken'
          options = opts.merge(p_token: true)
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