class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :start_date
      t.string :main_purpose
      t.string :other_purpose
      t.string :service_concerned
      t.string :service_function
      t.string :category_people_concerned
      t.string :personal_data
      t.string :sensitive_data
      t.string :recipient
      t.date :storage_time
      t.string :observation

      t.timestamps
    end
  end
end
