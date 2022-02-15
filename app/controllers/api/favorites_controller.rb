module Api 
  class FavoritesController < ApplicationController    
 
     def create
       # いいねするメモのIDを特定する
       memo = Memo.find(params[:memo_id])
       # current_userがfavoriteメソッドを実行する
       # Favorite.where(memo_id: 1).count
       # memo.favorites.count
       # memo.favorite_count
       if current_user.favorite(memo)
         render json: { favorite_count: memo.favorites.count }
       else
         render json: favorite.errors, status: 422
       end
     end
 
     def destroy
       # いいねを取り消すメモのIDを特定する
       memo = Memo.find(params[:id])
       # current_userがfavorite destoryアクションを投げる
       if current_user.unfavorite(memo)
         render json: { favorite_count: memo.favorites.count }
       end 
     end
   end
 end
