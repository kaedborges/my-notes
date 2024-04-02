class CreateNofitications < ActiveRecord::Migration[7.1]
  def change
    create_table :nofitications do |t|
      t.string :title
      t.string :description
      t.integer :type
      t.boolean :send_status
      t.date :send_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
