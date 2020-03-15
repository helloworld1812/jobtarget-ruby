RSpec.describe Jobtarget::Partner::Company do
  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#create' do
    it "create a company success with a p_token" do
      params = {
        "name": "Jobtarget Gem API#{SecureRandom.hex(4)}",
        "external_company_id": SecureRandom.hex(4),
        "billing_street_address": "123 Main St",
        "billing_city": "San Francisco",
        "billing_state": "California",
        "billing_zip": "94016",
        "billing_country": "United States",
      }
      opts = { params: params }
      response = JobTarget::Partner::Company.create(opts)
      expect(response['status']).not_to be(0)
      expect(response['company_name']).to be_eq(params['name'])
      expect(response['company_id']).not_to be_nil
    end
  end

  describe '#query' do
    it "query the companies with a p_token" do
      opts = { params: {} }
      response = JobTarget::Partner::Company.query(opts)
      expect(response['status']).to be(0)
      expect(response['companies'].size).not_to eq(0)
    end
  end

  describe '#jobs' do
    it "Get Companies Jobs p_token" do
      response = JobTarget::Partner::Company.query({})
      first_company = response['companies'].first
      company_id = first_company['company_id']

      opts = { params: { company_id: company_id, days: 30 } }
      response = JobTarget::Partner::Company.jobs(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#create_feed_url' do
    pending "create feed url for the partner" do
      opts = { params: { feed_url: '' } }
      response = JobTarget::Partner::Company.create_feed_url(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#update_feed_url' do
    pending "update feed url for the partner" do
      opts = { params: { feed_url: '' } }
      response = JobTarget::Partner::Company.update_feed_url(opts)
      expect(response['status']).to be(0)
    end
  end

  describe 'get_feed_url' do
    pending "update feed url for the partner" do
      opts = { params: {} }
      response = JobTarget::Partner::Company.get_feed_url(opts)
      expect(response['status']).to be(0)
    end
  end

end