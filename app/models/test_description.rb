class TestDescription < ActiveRecord::Base
  has_many :test_runs

  def summary
    @summary ||= description.split("\n").first
  end
end
