class Api::ConversationsController < Api::BaseController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    mailbox = set_mailbox
    conversations = @mailbox.page(params[:page]).per(params[:per_page])
    render json: conversations, meta: pagination(conversations, params[:per_page])
  end

  def show
    mailbox = set_mailbox
    conversation = mailbox.find(params[:id])
    render json: conversation
  end

  private

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
