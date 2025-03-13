class AddCurrentUserToFeedback < ActiveRecord::Migration[7.2]
  def change
    add_column :feedbacks, :current_user, :integer
  end
end
