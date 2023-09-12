class Addyear < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :year,  :string
  end
end
