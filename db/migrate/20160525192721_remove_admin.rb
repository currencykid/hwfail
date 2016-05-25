class RemoveAdmin < ActiveRecord::Migration
  def self.up
      remove_column :users, :admin
  end
end
