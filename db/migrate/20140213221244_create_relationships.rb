class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :broadcaster_id
      t.integer :consumer_id

      t.timestamps
    end
    add_index :relationships, :broadcaster_id
    add_index :relationships, :consumer_id
    add_index :relationships, [:broadcaster_id, :consumer_id], unique: true
  end
end
