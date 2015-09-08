class ChangeInputToContentInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :input, :content 
  end
end
