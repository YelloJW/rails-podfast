class CreateEpisodeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :episode_tags do |t|
      t.references :episode, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
