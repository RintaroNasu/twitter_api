class ChangeUserIdToStringInBookmarks < ActiveRecord::Migration[7.1]
  def change
    change_column :bookmarks, :user_id, :string
  end
end
