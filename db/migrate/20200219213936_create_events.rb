class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :address
      t.references :game, null: false, foreign_key: true
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
