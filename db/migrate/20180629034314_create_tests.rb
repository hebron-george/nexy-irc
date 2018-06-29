class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :box, null: true

      t.timestamps
    end
  end
end
