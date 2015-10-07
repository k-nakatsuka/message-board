class MessagesController < ApplicationController
  def index
    #メッセージを全て取得する。
    @messages = Message.all
    @message=Message.new
  end
  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
     #メッセージを保存できなかった時
     @messages=Message.all
      flash.now[:alert]="メッセージを保存に失敗しました"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end

end
