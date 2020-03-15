RSpec.describe Jobtarget::Company do
  let(:token) {
    opts = { params: { email: 'john.smith@workstream.is' } }
    response = JobTarget::Partner::User.auth(opts)
    response['token']
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#application' do
    it "Applicant Data" do
      random_str = SecureRandom.hex(2)
      params = {
        token: token,
        job_id: "24931703",
        posting_id: "96520948",
        first_name: "John",
        last_name: "Smith",
        email: "john#{random_str}.smith@gmail.com",
        status_id: 1,
      }
      opts = { params: params }
      response = JobTarget::Company.application(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#jobs' do
    it "Get Company Jobs" do
      params = { token: token, days: 30 }
      opts = { params: params }
      response = JobTarget::Company.jobs(opts)
      expect(response['status']).to be(0)
      expect(response['jobs'].size).not_to eq(0)
    end
  end

  describe '#divisions' do
    it "Get Company Divisions" do
      opts = { params: { token: token } }
      response = JobTarget::Company.divisions(opts)
      expect(response['status']).to be(0)
      expect(response['divisions'].size).not_to eq(0)
    end
  end

  describe '#users' do
    it "Get Company Users" do
      opts = { params: { token: token } }
      response = JobTarget::Company.users(opts)
      expect(response['status']).to be(0)
      expect(response['users'].size).not_to eq(0)
    end
  end

end