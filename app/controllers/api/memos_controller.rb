module Api
  class MemosController < ApplicationController
    
    def index
      render json: Memo.includes(:favorites).all
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
