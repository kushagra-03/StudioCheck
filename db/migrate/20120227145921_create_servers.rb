class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :api_url
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
