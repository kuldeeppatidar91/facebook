class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user
      t.references :sender
      t.references :receiver
      t.string     :text
      t.timestamps
    end
  end
end
