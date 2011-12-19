class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.string :name
      t.string :mail
      t.string :receipt_name
      t.boolean :be_lightning
      t.boolean :be_party
      t.text :other

      t.timestamps
    end
  end
end
