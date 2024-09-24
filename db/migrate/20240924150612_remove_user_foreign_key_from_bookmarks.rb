class RemoveUserForeignKeyFromBookmarks < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookmarks, :users
  end
end
