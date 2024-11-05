class CreateApiV1Books < ActiveRecord::Migration[7.1]
  def change
    create_table :api_v1_books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :publication_year
      t.boolean :archived
      t.boolean :old

      t.timestamps
    end
  end
end
