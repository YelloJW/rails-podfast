class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
