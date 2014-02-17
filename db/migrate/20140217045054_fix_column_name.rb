class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :squeeks, :friends_only, :consumers_only
  end
end
