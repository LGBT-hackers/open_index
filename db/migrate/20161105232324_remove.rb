class Remove < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :user_id
  end
end
