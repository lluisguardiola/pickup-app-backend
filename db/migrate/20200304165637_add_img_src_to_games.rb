class AddImgSrcToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :img_src, :string
  end
end
