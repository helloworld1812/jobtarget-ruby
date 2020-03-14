RSpec.describe Jobtarget::Company do
  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#create' do
    it "create a company success with a p_token" do
      params = {
        "name": "Jobtarget Gem API",
        "external_company_id": SecureRandom.hex(4),
        "billing_street_address": "123 Main St",
        "billing_city": "San Francisco",
        "billing_state": "California",
        "billing_zip": "94016",
        "billing_country": "United States",
      }
      opts = { params: params }
      response = JobTarget::Company.create(opts)
      expect(response['status']).not_to be 0
      expect(response['company_name']).to be_eq(params['name'])
      expect(response['company_id']).not_to be_nil

      expect(JobTarget::Company.create(opts)).not_to be nil
      expect(JobTarget::Company.create(opts)).not_to be nil

      # {
      #   "status": 0,
      #   "message": "success",
      #   "company_name": "Workstream Gem API",
      #   "company_id": 33032,
      #   "tracking_pixel": "https://www.click2apply.net/a/c/kr6R",
      #   "create_date": "3/12/2020 11:47:11 PM"
      # }
    end
  end
  it "has a version number" do
    expect(Jobtarget::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
end