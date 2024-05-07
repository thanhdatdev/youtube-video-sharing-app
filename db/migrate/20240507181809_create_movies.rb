class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.belongs_to :user
      t.string     :url

      t.timestamps
    end
  end
end
