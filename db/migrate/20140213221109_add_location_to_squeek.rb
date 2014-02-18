class AddLocationToSqueek < ActiveRecord::Migration
  def change
    add_column :squeeks, :location, :string
  end
end
