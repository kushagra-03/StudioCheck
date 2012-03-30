class RenameTestCasesTableToTestDescriptions < ActiveRecord::Migration
  def up
    rename_table(:test_cases, :test_descriptions)
    rename_column(:test_runs, :test_case_id, :test_description_id)
  end

  def down
    rename_table(:test_descriptions, :test_cases)
    rename_column(:test_runs, :test_description_id, :test_case_id)
  end
end
