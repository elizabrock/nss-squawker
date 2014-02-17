class AddHiddenToSqueeks < ActiveRecord::Migration
  def change
    add_column :squeeks, :hidden, :boolean, :default => false, :null => false
  end
end
