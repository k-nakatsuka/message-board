class MessagesController < ApplicationController
  def index
    @messages=Message.all
  end
  def create
    @message=Mwssage.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージwp保存しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end

end
