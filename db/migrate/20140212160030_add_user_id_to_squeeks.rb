class AddUserIdToSqueeks < ActiveRecord::Migration
  def change
    add_column :squeeks, :user_id, :integer
  end
end
