class AddTagImgToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :tag_img, :string
  end
end
