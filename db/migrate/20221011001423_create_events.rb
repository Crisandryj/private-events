class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :creator, foreign_key: { to_table: :users }

      t.string :title
      t.date :date
      t.timestamps
    end
  end
end
