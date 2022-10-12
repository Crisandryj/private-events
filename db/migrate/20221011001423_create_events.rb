class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.belongs_to :creator, foreign_key:true

      t.string :title
      t.date :date
      t.timestamps
    end
  end
end
