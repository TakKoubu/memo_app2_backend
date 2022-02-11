module Api 
 class FavoritesController < ApplicationController
    def create
      # いいねするメモのIDを特定する
      memo = Memo.find(params[:memo_id])
      # current_userがfavoriteメソッドを実行する
      current_user.favorite(memo)
    end

    def destroy
      # いいねを取り消すメモのIDを特定する
      memo = Memo.find(params[:id])
      # current_userがfavorite destoryアクションを投げる
      current_user.unfavorite(memo)
    end
  end
end
