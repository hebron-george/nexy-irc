class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :auth_name, null: true
      t.string  :host_mask, null: true
      t.references :user_level, default: 5 # default to 'anyone'

      t.timestamps
    end
  end
end
