RSpec.describe Jobtarget::Partner::User do
  let(:company) {
    response = JobTarget::Partner::Company.query({})
    response['companies'].first
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
    @default_email = 'john.smith@workstream.is'
  end

  describe '#auth' do
    it "Get User Token" do
      email = @default_email
      opts = { params: { email: email } }
      response = JobTarget::Partner::User.auth(opts)
      expect(response['status']).to be(0)
      expect(response['token']).not_to be(nil)
    end
  end

  describe '#create' do
    it "Create User" do
      random_str = SecureRandom.hex(2)
      company_id = company['company_id']
      user = {
        first_name: "John#{random_str}",
        last_name: 'smith',
        title: 'senior recruiter',
        email: "john#{random_str}.smith@gmail.com",
        is_admin: 1,
        company_id: company_id,
        external_user_id: random_str
      }
      opts = { params: { user: user } }
      response = JobTarget::Partner::User.create(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#update' do
    it "User Edit" do
      response = JobTarget::Partner::User.query({})
      users = response['users']
      user = users.select { |user| user['email'] != @default_email }.first
      user_id = user['user_id']

      random_str = SecureRandom.hex(2)
      user = {
        user_id: user_id,
        first_name: "John#{random_str}",
        last_name: 'smith',
        title: 'senior recruiter',
        email: "john#{random_str}.smith@gmail.com",
        is_admin: 1,
        company_id: 0,
        external_user_id: '0'
      }
      opts = { params: { user: user } }
      response = JobTarget::Partner::User.update(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#query' do
    it "Get Users Via p_token" do
      opts = { params: {} }
      response = JobTarget::Partner::User.query(opts)
      expect(response['status']).to be(0)
    end
  end

end