class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string     :ingredient_name,   null: false
      t.timestamps
    end
  end
end
