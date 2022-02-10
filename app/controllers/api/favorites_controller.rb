module Api 
 class FavoritesController < ApplicationController
    def create
      # いいねするメモのIDを特定する
      # current_userがfavoriteメソッドを実行する
      memo = Memo.find(params[:memo_id])
      current_user.favorite(memo)
    end
  end
end
