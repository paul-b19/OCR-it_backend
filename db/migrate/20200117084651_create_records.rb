class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :group
      t.string :title
      t.string :body
      t.float :confidence
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
