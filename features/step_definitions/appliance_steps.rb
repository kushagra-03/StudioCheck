require 'studio_api'

Before do
  connection = StudioApi::Connection.new(ENV['USER'], ENV['PASS'], ENV['URL'])
  StudioApi::Util.configure_studio_connection(connection)
end

After do
  @appliance.destroy if @appliance
end

Given /^I have created a (.*?) appliance$/ do |template_name|
  templates = StudioApi::TemplateSet.find(:all).find { |s| s.name == "default" }.template
  template = templates.find { |t| t.name == template_name }
  @appliance = StudioApi::Appliance.clone(template.appliance_id, :name => "test", :arch => "x86_64")
end

Given /^I add (\d+)M LVM volume (.*)$/ do |lvm_size, lvm_name|
  @appliance.add_package("lvm2")
  @configuration ||= @appliance.configuration
  @configuration.lvm.enabled = "true"
  @configuration.lvm.volume_group = "testVG"

  lvm_path = lvm_name.capitalize.gsub(/(?=[A-Z])/, "/")
  @configuration.lvm.volumes = [
    { :path => lvm_path, :size => lvm_size },
  ]
  @configuration.save
end

When /^I build it$/ do
  @build = StudioApi::RunningBuild.new(:appliance_id => @appliance.id, :image_type => "oem", :job_type => "simple")
  @build.save
  @build.reload
  while @build.state !~ /(finished|failed|error)/
    sleep 5
    @build.reload
  end
end

Then /^the (?:result|build) should be successful$/ do
  @finished_build = StudioApi::Build.find(@build.id)
  @finished_build.state.should == "finished"
end
