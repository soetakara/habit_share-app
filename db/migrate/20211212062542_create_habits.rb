class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|

      t.string :title        ,null: false
      t.string :item1        ,null: false
      t.string :item2
      t.string :item3
      t.string :item4
      t.string :item5

      t.references :user     ,null: false, foreign_key: true

      t.timestamps
    end
  end
end
