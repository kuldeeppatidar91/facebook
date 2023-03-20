class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :mobile_number
      t.string :email_id
      t.datetime :date_of_birth
      t.string :gender
      t.string :work
      t.string :education
      t.string :address
      t.string :email, default: "", null: false
      t.string   :password, default: "", null: false


      t.timestamps
    end
  end
end
