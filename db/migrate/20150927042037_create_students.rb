class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :p_hash

      t.timestamps null: false
    end
  end
end
