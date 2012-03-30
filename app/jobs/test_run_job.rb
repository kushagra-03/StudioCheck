class TestRunJob
  @queue = :tests

  def self.perform(id)
    test_run = TestRun.find(id)
    dir = File.join(Rails.root, "features")
    feature = File.join(dir, "#{test_run.test_description.id}-#{test_run.id}.feature")
    log = File.join(dir, "#{test_run.test_description.id}-#{test_run.id}.log")

    File.open(feature, "w") { |f| f.write(test_run.test_description.description) }

    env = {
      'USER' => test_run.server.username,
      'PASS' => test_run.server.password,
      'URL'  => test_run.server.api_url,
    }

    Open3.pipeline_r([env, "cucumber", "-S", feature, :err => :out], ["tee", "-a", log], :chdir => Rails.root) do |output, threads|
      test_run.log = output.readlines.join
      test_run.result = (threads.first.value == 0)
    end
  ensure
    test_run.save!
    FileUtils.rm(feature) if File.exists?(feature)
    FileUtils.rm(log) if File.exists?(log)
  end

end
