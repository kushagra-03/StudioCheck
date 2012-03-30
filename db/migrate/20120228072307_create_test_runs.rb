class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.integer :server_id
      t.integer :test_case_id
      t.boolean :result
      t.text :log

      t.timestamps
    end
  end
end
