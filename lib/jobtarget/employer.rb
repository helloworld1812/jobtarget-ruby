module Jobtarget
  class Employer

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
      def auth_user(opts = {})
        path = '/api/employer/auth/gettoken'
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