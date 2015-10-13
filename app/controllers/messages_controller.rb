class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  def index
    #メッセージを全て取得する。
    @messages = Message.all
    @message = Message.new
  end
  def edit
  end
  def update
    if @message.update(message_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
     #メッセージを保存できなかった時
     @messages=Message.all
      flash.now[:alert] = "メッセージを保存に失敗しました"
      render 'index'
    end
  end
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end
