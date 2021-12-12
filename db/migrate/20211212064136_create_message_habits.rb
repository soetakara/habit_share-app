class CreateMessageHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :message_habits do |t|

      t.references :habit     ,null: false, foreign_key: true
      t.references :message   ,null: false, foreign_key: true

      t.timestamps
    end
  end
end
