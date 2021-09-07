class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :ingredients
      t.timestamps
      t.references :dish, null: false, foreign_key: true
    end
  end
end
