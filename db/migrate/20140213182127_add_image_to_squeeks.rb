class AddImageToSqueeks < ActiveRecord::Migration
  def change
    add_column :squeeks, :image, :string
  end
end
