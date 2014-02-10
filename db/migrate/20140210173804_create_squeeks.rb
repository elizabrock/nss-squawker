class CreateSqueeks < ActiveRecord::Migration
  def change
    create_table :squeeks do |t|
      t.text :body

      t.timestamps
    end
  end
end
