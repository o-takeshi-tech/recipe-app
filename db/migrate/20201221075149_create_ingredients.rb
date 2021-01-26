class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name, null: false, uniqueness: true
      t.string :quantity,        null: false, uniqueness: true
      t.timestamps
    end
  end
end
