module Api 
 class FavoritesController < ApplicationController
    def create
      # いいねするメモのIDを特定する
      # current_userがfavoriteメソッドを実行する
      memo = Memo.find(params[:memo_id])
      current_user.favorite(memo)
    end

    def destroy
      # いいねを取り消すメモのIDを特定する
      # current_userがfavorite destoryアクションを投げる
      # binding.pry
      memo = Memo.find(params[:id])
      current_user.unfavorite(memo)
    end
  end
end
