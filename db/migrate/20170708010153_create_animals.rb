class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :nombre
      t.references :animal_type, foreign_key: true

      t.timestamps
    end
  end
end
