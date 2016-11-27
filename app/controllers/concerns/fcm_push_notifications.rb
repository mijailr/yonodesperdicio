require 'fcm'

module FCMPushNotifications
  extend ActiveModel::Concern

  def self.message_sent(receipt)
  	fcm = FCM.new(Rails.application.secrets["fcm_api_key"])

		registration_ids= [receipt.receiver.fcm_registration_token]

		if registration_ids.empty?
			Rails.logger.info "FCMPushNotifications: recipient (#{registration_ids.inspect}) doesn't have fcm_registration_token"
		  return
		end 

		options = {
			data: 
			{
				message_id: receipt.message_id, 
				conversation: receipt.conversation_id, 
				author_id: receipt.message.sender.id 
			}
		}
		
		response = fcm.send(registration_ids, options)
  end
end 



