class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :name,        null: false
      t.text        :description, null: false
      t.references  :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
