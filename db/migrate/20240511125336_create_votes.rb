class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :movie
      t.integer :kind
      t.timestamps
    end
  end
end
