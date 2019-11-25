class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :length
      t.integer :upvotes
      t.text :summary

      t.timestamps
    end
  end
end
