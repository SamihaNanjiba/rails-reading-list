class AddOldToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :old, :boolean
  end
end
