class ChangeEmailSettingsForOauthFlow < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => true
    change_column_default :users, :email, nil

  end
end
