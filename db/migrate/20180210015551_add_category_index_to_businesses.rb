class AddCategoryIndexToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_reference :businesses, :category, index: true
  end
end
