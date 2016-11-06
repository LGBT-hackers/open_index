class AddUserIdToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :user, index: true, foreign_key: true
  end
end
