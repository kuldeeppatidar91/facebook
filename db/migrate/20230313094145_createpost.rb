class Createpost < ActiveRecord::Migration[7.0]
  def change
     create_table :posts do |t|
     t.string :article
      t.references :user
    t.timestamps
  end
  end
end
