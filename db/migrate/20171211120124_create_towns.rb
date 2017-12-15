class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.string :city
      t.string :address
      t.string :mayor_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
