class AddUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
