RSpec.describe Jobtarget::Job do
  let(:token) {
    opts = { params: { email: 'john.smith@workstream.is' } }
    response = JobTarget::Partner::User.auth(opts)
    response['token']
  }

  let(:default_job) {
    opts = { params: { token: token, days: 30 } }
    response = JobTarget::Job.query(opts)
    response['jobs'].first
  }

  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
  end

  describe '#create' do
    it "Create Job" do
      random_str = SecureRandom.hex(2)
      job = {
        requisition_name: "new job for #{random_str}",
        company_name: 'ABC Corp',
        title: 'SQL DBA',
        description: 'you have to do dba stuff and work with devs',
        jobfunction: 65,
        job_view_url: 'http://www.jobview.com/position/12345',
        apply_url: 'http://www.applyhere.com/234',
        location: {
          city: 'Groton',
          state: 'CT',
          country: 'US',
          zip: '06340'
        }
      }
      opts = { params: { token: token, job: job } }
      response = JobTarget::Job.create(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#update' do
    it "Edit Job/Postings" do
      random_str = SecureRandom.hex(2)
      job = {
        job_id: default_job['job_id'],
        requisition_name: "new job for #{random_str}",
        company_name: 'ABC Corp',
        title: 'SQL DBA',
        description: 'you have to do dba stuff and work with devs',
        jobfunction: 65,
        job_view_url: 'http://www.jobview.com/position/12345',
        apply_url: 'http://www.applyhere.com/234',
        location: {
          city: 'Groton',
          state: 'CT',
          country: 'US',
          zip: '06340'
        }
      }
      opts = { params: { token: token, job: job } }
      response = JobTarget::Job.update(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#query' do
    it "Get User Jobs" do
      opts = { params: { token: token, days: 30 } }
      response = JobTarget::Job.query(opts)
      expect(response['status']).to be(0)
      expect(response['jobs'].size).not_to eq(0)
    end
  end

  describe '#get' do
    it "Get Job Details / Postings" do
      opts = { params: { token: token, job_id: default_job['job_id'] } }
      response = JobTarget::Job.get(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#stop' do
    it "Stop Job" do
      opts = { params: { token: token, job_id: default_job['job_id'] } }
      response = JobTarget::Job.get(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#division_jobs' do
    it "Get User Division Jobs" do
      opts = { params: { token: token, days: 60 } }
      response = JobTarget::Job.division_jobs(opts)
      expect(response['status']).to be(0)
      expect(response['jobs'].size).not_to eq(0)
    end
  end

  describe '#create_posting' do
    it "Create Posting" do
      params = {
        token: token,
        job_id: default_job['job_id'],
        cc_id: "invoice",
        postings: [{
                     "site_id": "2149",
                     "product_id": "18877",
                     "posting_data": [{ "name": "state", "value": "121" }]
                   }]
      }
      opts = { params: params }
      response = JobTarget::Job.create_posting(opts)
      expect(response['status']).to be(0)
      expect(response['postings'].size).not_to eq(0)
    end
  end

  describe '#stop_posting' do
    it "Stop Posting" do
      params = {
        token: token,
        job_id: default_job['job_id'],
        posting_id: 118182313
      }
      opts = { params: params }
      response = JobTarget::Job.stop_posting(opts)
      expect(response['status']).to be(0)
    end
  end

  describe '#edit_location' do
    it "Edit Location for job" do
      params = {
        token: token,
        job_id: default_job['job_id'],
        type: 'job',
        location: [{
                   city: "New York City",
                   state: "NY",
                   country: "US",
                   zip: "10004",
                   external_location_id: "NY_1235451"
                 }]
      }
      opts = { params: params }
      response = JobTarget::Job.edit_location(opts)
      expect(response['status']).to be(0)
    end

    it "Edit Location for posting" do
      params = {
        token: token,
        job_id: default_job['job_id'],
        type: 'posting',
        posting_id: 118182313,
        location: [{
                     city: "New York City",
                     state: "NY",
                     country: "US",
                     zip: "10004",
                     external_location_id: "NY_1235451"
                   }]
      }
      opts = { params: params }
      response = JobTarget::Job.edit_location(opts)
      expect(response['status']).to be(0)
    end
  end

end