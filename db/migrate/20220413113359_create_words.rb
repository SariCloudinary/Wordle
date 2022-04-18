class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :name, limit: 5, unique: true

      t.timestamps
    end
  end
end
