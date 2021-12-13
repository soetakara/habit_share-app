class CreateRoomHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :room_habits do |t|

      t.references :habit    ,null: false, foreign_key: true
      t.references :room     ,null: false, foreign_key: true

      t.timestamps
    end
  end
end
