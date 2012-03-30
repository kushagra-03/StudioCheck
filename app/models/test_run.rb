class TestRun < ActiveRecord::Base
  belongs_to :server
  belongs_to :test_description

  def run
    self.update_attributes!(:log => nil, :result => nil)
    Resque.enqueue(TestRunJob, self.id)
  end

  def run_log
    @logfile ||= File.join(Rails.root, "features", "#{self.test_description.id}-#{self.id}.log")
    if File.exists?(@logfile)
      File.read(@logfile)
    else
      self.log
    end
  end
end
