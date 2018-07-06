class AddUserLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_levels do |t|
      t.string  :title, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
