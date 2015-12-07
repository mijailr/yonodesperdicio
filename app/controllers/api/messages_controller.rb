class Api::MessagesController < Api::BaseController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    mailbox = set_mailbox
    Rails.logger.info "========================= #{mailbox}"
    messages = mailbox.find(params[:conversation_id]).messages.page(params[:page]).per(params[:per_page])
    render json: messages, meta: pagination(messages, params[:per_page])
  end

  def show
    mailbox = set_mailbox
    respond_with current_user.mailbox.conversations.find(params[:id])
  end

  def create
    recipient = User.find(params[:recipient_id])
    message = Mailboxer::Message.new message_params
    message.sender = current_user
    message.recipient = recipient

    if message.save
      render json: message, status: 201
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  private

  def message_params
    params.require(:message).
    permit(:subject, :body, :recipient_id, :conversation_id)
  end

  def set_mailbox
    if params[:mailbox_id] == 'sent'
      current_user.mailbox.sent
    elsif params[:mailbox_id] == 'trash'
      current_user.mailbox.trash
    else
      current_user.mailbox.inbox
    end
  end
end
