class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :url
      t.timestamps null: false
    end
  end
end
