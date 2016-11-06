class AddReviewIdToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :review, index: true, foreign_key: true
  end
end
