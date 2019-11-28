class CreatePlaylistEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_episodes do |t|
      t.references :episode, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
