class MessagesController < ApplicationController
  def index
  end
  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    eles
     #メッセージを保存できなかった時
     @message=Message.all
      flash.now[:alert]="メッセージを保存に失敗しました"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end

end
