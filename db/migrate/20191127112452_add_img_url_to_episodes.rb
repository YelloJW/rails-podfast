class AddImgUrlToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :img_url, :string
  end
end
