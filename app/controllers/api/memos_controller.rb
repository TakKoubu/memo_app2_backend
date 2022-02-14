module Api
  class MemosController < ApplicationController
    
    def index
      like_memo_ids = current_user.favorites.pluck(:memo_id) 
      memos = Memo.all.map do |memo|
        memo.is_like = memo.id.in?(like_memo_ids)
        memo.favorite_count = memo.favorites.count
        memo
      end
      render json: memos.to_json(methods: [:is_like, :favorite_count])
    end

    def create
      memo = current_user.memos.build(memo_params)
      if memo.save
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end
  
    def destroy
      # 削除するメモのIDを特定する
      # そのメモを削除する
      memo = Memo.find(params[:id])
      memo.destroy!
    end

    private

    def memo_params
      params.require(:memo).permit(:content)
    end
  end
end
