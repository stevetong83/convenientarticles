class MessagesController < ApplicationController

  def contact
    @page_title = "Contact"
    @message = Message.new
  end

  def create
    @message = Message.new params[:message]
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      flash[:notice] = "Message sent! Thanks for contacting us"
      redirect_to root_path
    else
      render :action => 'contact'
    end
  end
end
