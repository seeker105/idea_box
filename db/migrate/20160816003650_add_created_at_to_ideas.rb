class AddCreatedAtToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :created_at, :datetime
  end
end
