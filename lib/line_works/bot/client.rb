require 'line/bot'

module LineWorks
  module Bot
    # API Client of Line Works Bot SDK Ruby
    #
    #   @client ||= LineWorks::Bot::Client.new do |config|
    #     config.channel_id = ENV["LINE_WORKS_CHANNEL_ID"]
    #     config.channel_secret = ENV["LINE_WORKS_BOT_SECRET"]
    #     config.channel_token = ENV["LINE_WORKS_CHANNEL_TOKEN"]
    #   end
    class Client < Line::Bot::Client

      def endpoint
        @endpoint ||= API::DEFAULT_ENDPOINT
      end

      # Send messages to a channel using channel_id.
      #
      # @param bot_id [String] Bot Id
      # @param channel_id [String] Channel Id
      # @param messages [String] Message Objects
      # @param headers [Hash] HTTP Headers
      # @param payload [Hash] Additional request body
      # @return [Net::HTTPResponse]
      def send_message_to_talkroom(bot_id, channel_id, messages, headers: {})
        channel_token_required

        payload = {
          "content" => {
            "type" => "text",
            "text" => messages
          }
        }
    
        endpoint_path = "/bots/#{bot_id}/channels/#{channel_id}/messages"

        payload = payload.to_json
p [endpoint_path, payload]
        post(endpoint, endpoint_path, payload, credentials.merge(headers))
      end

    end
  end
end
