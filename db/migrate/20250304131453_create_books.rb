class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :book_name
      t.integer :MRP
      t.integer :pages
      t.string :publisher_name
      t.date :publication_date
      t.string :language
      t.text :description

      t.timestamps
    end
  end
end
