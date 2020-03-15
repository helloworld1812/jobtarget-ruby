RSpec.describe Jobtarget::JobSite do
  let(:token) {
    opts = { params: { email: 'john.smith@workstream.is' } }
    response = JobTarget::Partner::User.auth(opts)
    response['token']
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#lookup' do
    it "Job Site Lookup" do
      opts = { params: { token: token, search: 'nurse' } }
      response = JobTarget::JobSite.lookup(opts)
      expect(response['status']).to be(0)
      expect(response['sites'].size).not_to eq(0)
    end
  end

  describe '#get' do
    it "Get Site Info" do
      opts = { params: { token: token, site_id: 763 } }
      response = JobTarget::JobSite.get(opts)
      expect(response['status']).to be(0)
      expect(response['products'].size).not_to eq(0)
    end
  end

end