class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string  :category
      t.integer :user_id
      t.integer :company_id
      t.integer :question_1
      t.integer :question_2
      t.integer :question_3
      t.integer :question_4
      t.integer :question_5
      t.integer :question_6
      
      t.timestamps
    end
  end
end
