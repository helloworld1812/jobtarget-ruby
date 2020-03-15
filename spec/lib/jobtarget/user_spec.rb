RSpec.describe Jobtarget::User do
  let(:token) {
    opts = { params: { email: 'john.smith@workstream.is' } }
    response = JobTarget::Partner::User.auth(opts)
    response['token']
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#login' do
    it "Login User" do
      opts = { params: { token: token } }
      response = JobTarget::User.login(opts)
      expect(response['status']).to be(0)
      expect(response['login_url']).not_to be(nil)
    end
  end

  describe '#info' do
    it "Get User Info" do
      opts = { params: { token: token } }
      response = JobTarget::User.info(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#divisions' do
    it "Get User Divisions" do
      opts = { params: { token: token } }
      response = JobTarget::User.divisions(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#credit_cards' do
    it "Get User Credit Cards" do
      opts = { params: { token: token } }
      response = JobTarget::User.credit_cards(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#order_info' do
    it "Get Order Information" do
      opts = { params: { token: token, order_id: "21629440" } }
      response = JobTarget::User.order_info(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#receipts' do
    pending "Get Order Receipts" do
      opts = { params: { token: token, orders: [21629440] } }
      response = JobTarget::User.receipts(opts)
      expect(response['status']).to be(0)
      expect(response['receipt_url']).not_to be(nil)
    end
  end

end