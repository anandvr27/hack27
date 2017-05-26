class AddOmniauthTo < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string
    add_column :users, :UID, :string
  end
end
