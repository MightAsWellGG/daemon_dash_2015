class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :isbn
      t.string :condition
      t.integer :price
      t.string :seller_email
      t.string :comments
      t.string :course_name

      t.timestamps null: false
    end
  end
end
