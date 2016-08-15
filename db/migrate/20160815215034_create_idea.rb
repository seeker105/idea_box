class CreateIdea < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :body
      t.integer :quality, default: 0
    end
  end
end
