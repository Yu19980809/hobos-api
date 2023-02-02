class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :open_id
      t.string :role
      t.string :slogan
      t.text :experience

      t.timestamps
    end
  end
end
