class InitialSchema < ActiveRecord::Migration[5.1]
  def change
    
    create_table :businesses do |t|
      t.string :name
      t.text   :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :email
    end
    
    create_table :experiences do |t|
      t.string  :comment
      t.integer :rating
    end
    
    create_table :categories do |t|
      t.string :name
    end
  end
end
