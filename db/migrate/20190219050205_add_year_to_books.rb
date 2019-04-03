class AddYearToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :year, :string
  end
end
