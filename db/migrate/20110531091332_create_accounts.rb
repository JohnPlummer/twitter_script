class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string  :name
      t.string  :access_token
      t.string  :access_secret
      t.boolean :verified

      t.timestamps
    end

    add_index :accounts, :name

  end

  def self.down
    drop_table :accounts
  end
end
