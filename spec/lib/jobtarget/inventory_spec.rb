RSpec.describe Jobtarget::Inventory do
  let(:token) {
    opts = { params: { email: 'john.smith@workstream.is' } }
    response = JobTarget::Partner::User.auth(opts)
    response['token']
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#query' do
    it "Get Inventory" do
      opts = { params: { token: token } }
      response = JobTarget::Inventory.query(opts)
      expect(response['status']).to be(0)
    end
  end

end