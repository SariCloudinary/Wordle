class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.integer :score, default:0
      t.string :email

      t.timestamps
    end
  end
end
