module Api 
 class FavoritesController < ApplicationController
    def index
      render json: User.all
    end
    
    def create
      # いいねするメモのIDを特定する
      memo = Memo.find(params[:memo_id])
      # current_userがfavoriteメソッドを実行する
      current_user.favorite(memo)
      render json: favorite_count: 3
    end

    def destroy
      # いいねを取り消すメモのIDを特定する
      memo = Memo.find(params[:id])
      # current_userがfavorite destoryアクションを投げる
      current_user.unfavorite(memo)
    end
  end
end
