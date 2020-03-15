module Jobtarget
  class Company

    class << self

      # Applicant Data - /api/employer/company/applicantdata
      # params
      #   p_token - the partner token/key that must be passed to authenticate API access
      #   job_id - optional
      #   posting_id - optional
      #   profile_id - optional
      #   hash_id - optional
      #   created_date - date when the interview or hire occurred (optional)
      #   first_name - required
      #   last_name - required
      #   email - required
      #   status_id - options are '1=interview', '2=hire' and '3=application' (required)
      #   {
      #     "token": "USER_TOKEN_VALUE",
      #     "job_id": "24931703",
      #     "posting_id": "96520948",
      #     "first_name": "John",
      #     "last_name": "Smith",
      #     "email": "john@smith.com",
      #     "status_id": "2",
      #     "profile_id": "123",
      #     "hash_id": "123",
      #     "created_date": "12-31-2016"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the status
      #   {
      #     "status": 0,
      #     "message": "success"
      #   }
      def application(opts = {})
        path = '/api/employer/company/applicantdata'
        options = { params: opts[:params] || {}, token: true }
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Company Jobs - /api/employer/company/jobs
      # params
      #   token - the user token that must be passed to authenicate API access
      #   days - how far back (in days) you wish to retrieve jobs (based upon last updated date)
      #   {
      #     "token
      #     "days"
      #   }
      # response
      #   token - the user token that must be passed to authenicate API access
      #   days - how far back (in days) you wish to retrieve jobs (based upon last updated date)	status - 0 indicates success. Anything else indicates an issue
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
      #
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "jobs": [
      #       {
      #         "job_id": 26733560,
      #         "requisition_name": "my-new-job-2",
      #         "position": "SQL DBA",
      #         "division_id": 1000286,
      #         "division_name": "Imported Jobs",
      #         "updated_date": "2020-02-24T16:17:00",
      #         "created_date": "2020-02-24T16:17:00",
      #         "job_manage_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/edit/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733560",
      #         "job_post_url": "https://jtbosocwebuat01.jobtarget.com/oc/sso/post/88207026-a1ce-4c28-9222-25ee5f12f9cd/26733560"
      #       }
      #     ]
      #   }
      #
      def jobs(opts = {})
        path = '/api/employer/company/jobs'
        options = { params: opts[:params], token: true }
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Company Divisions - /api/employer/company/divisions
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status.
      #   division_id – the unique ID number for that division in OneClick
      #   name – the name for that division in OneClick
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "divisions": [{ "division_id": 1000286, "name": "Imported Jobs" }]
      #   }
      def divisions(opts = {})
        path = '/api/employer/company/divisions'
        options = { params: opts[:params], token: true }
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

      # Get Company Users - /api/employer/company/users
      # params
      #   token - the user token that must be passed to authenticate API access
      #   {
      #     "token": "USER_TOKEN_VALUE"
      #   }
      # response
      #   status - 0 indicates success. Anything else indicates an issue
      #   message - message related to the Status
      #   user_id – OneClick’s unique ID for this user
      #   first_name – the user’s first name
      #   last_name – the user’s last name
      #   email – the user’s email address
      #   user_type – the user role as defined in OneClick (Admin or Recruiter)
      #   {
      #     "status": 0,
      #     "message": "success",
      #     "users": [
      #                 {
      #                   "user_id": "1000287",
      #                   "first_name": "John",
      #                   "last_name": "smith",
      #                   "email": "john.smith@workstream.is",
      #                   "user_type": "Admin"
      #                 },
      #                 {
      #                   "user_id": "1000334",
      #                   "first_name": "Jane",
      #                   "last_name": "Doe",
      #                   "email": "jane.doe@workstream.is",
      #                   "user_type": "Admin"
      #                 }
      #               ]
      #   }
      def users(opts = {})
        path = '/api/employer/company/users'
        options = { params: opts[:params], token: true }
        response = Jobtarget::Connection.post_json(path, options)
        puts '-----------get response start-------------------'
        puts response
        puts '-----------get response end-------------------'
        response
      end

    end

  end
end