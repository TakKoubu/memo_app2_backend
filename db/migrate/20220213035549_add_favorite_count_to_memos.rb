class AddFavoriteCountToMemos < ActiveRecord::Migration[6.0]
  def change
    add_column :memos, :favorite_count, :integer
  end
end
