class AddYearToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :year, :integer
  end
end
