class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :company_id
      t.integer :user_id
      t.timestamps
    end
  end
end
