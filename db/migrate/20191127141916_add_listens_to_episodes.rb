class AddListensToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :listens, :integer
  end
end
