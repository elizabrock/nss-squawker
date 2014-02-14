class AddFriendsOnlyToSqueeks < ActiveRecord::Migration
  def change
    add_column :squeeks, :friends_only, :boolean
  end
end
