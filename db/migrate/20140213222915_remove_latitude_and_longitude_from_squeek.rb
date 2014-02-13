class RemoveLatitudeAndLongitudeFromSqueek < ActiveRecord::Migration
  def change
    remove_column :squeeks, :longitude
    remove_column :squeeks, :latitude
  end
end
