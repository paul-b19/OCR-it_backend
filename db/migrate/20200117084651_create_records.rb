class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :group
      t.string :title
      t.string :body
      t.float :confidence
      t.integer :user_id

      t.timestamps
    end
  end
end
