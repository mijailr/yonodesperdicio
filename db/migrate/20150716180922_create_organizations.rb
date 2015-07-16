class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :CP
      t.text :address

      t.timestamps null: false
    end
  end
end
