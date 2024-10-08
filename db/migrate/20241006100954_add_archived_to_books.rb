class AddArchivedToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :archived, :boolean
  end
end
