class Question < ActiveRecord::Base
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :view_count
      t.timestamps
    end
    add_index :questions, :index #index a certain field so it speeds up searches on that text field.
  end
end
