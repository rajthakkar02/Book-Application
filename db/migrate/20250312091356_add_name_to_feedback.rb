class AddNameToFeedback < ActiveRecord::Migration[7.2]
  def change
    add_column :feedbacks, :name, :string
  end
end
