class AddUserIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator, :integer
  end
end
