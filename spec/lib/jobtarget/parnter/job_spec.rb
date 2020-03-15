RSpec.describe Jobtarget::Partner::Job do
  before(:each) do
    JobTarget.configure(ENV['P_TOKEN'])
    @requisition_name = 'my-new-job1'
    @job_id = 26735281
  end

  describe '#get' do
    it "Get Job Details via p_token" do
      opts = { params: { requisition_name: @requisition_name } }
      response = JobTarget::Partner::Job.get(opts)
      expect(response['status']).to be(0)
    end
  end


  describe '#stop' do
    it "Stop Job Via p_token" do
      opts = { params: { job_id: @job_id } }
      response = JobTarget::Partner::Job.stop(opts)
      expect(response['status']).to be(0)
    end
  end


end