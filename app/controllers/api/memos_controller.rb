module Api
  class MemosController < ApplicationController
    # before_action :logged_in_user, only: [:create, :destroy]
    # before_action :correct_user,   only: :destroy

    def index
      render json: Memo.all
    end

    def create
      user = User.find(1)
      memo = user.memos.build(memo_params)
      if memo.save
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end
  
    def destroy
      memo.destroy
    end

    private

    def memo_params
      params.require(:memo).permit(:content)
    end

    # def correct_user
    #   memo = current_user.memos.find_by(id: params[:id])
    # end
  end
end