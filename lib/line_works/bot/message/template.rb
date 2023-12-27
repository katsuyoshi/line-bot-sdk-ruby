module LineWorks
  module Bot
    module Message
      # @see: https://developers.worksmobile.com/jp/docs/bot-channel-message-send
      class Template

        class << self

          # Get a text message hash value.
          #
          # @param messages [String] Message
          # @return [Hash]
          def text message
            {
              type: 'text',
              text: message
            }
          end

          # Get a stamp message hash value.
          #
          # @param package_id [Integer] Package Id
          # @param sticker_id [Integer] Sticker Id
          # @return [Hash]
          def stamp package_id, sticker_id
            {
              type: 'sticker',
              packageId: package_id.to_s,
              stickerId: sticker_id.to_s
            }
          end

          # Get an image message hash value with image urls.
          #
          # @param preview_url [String] Preview image url (png)
          # @param original_url [String] Original image url (png)
          # @return [Hash]
          def image original_url, preview_url = nil 
            {
              type: 'image',
              previewImageUrl: preview_url || original_url,
              originalContentUrl: original_url,
            }
          end

          # Get an image message hash value with file id.
          #
          # @param preview_url [Integer] Preview image url (png)
          # @param filed [String] File id
          # @return [Hash]
          def image_with_file file_id
            {
              type: 'image',
              fileId: file_id
            }
          end

          # Get a file message hash value with url.
          #
          # @param file_url [String] File url
          # @return [Hash]
          def file file_url
            {
              type: 'file',
              originalContentUrl: file_url,
            }
          end

          # Get a file message hash value with file id.
          #
          # @param file_url [String] File url
          # @return [Hash]
          def file_with_id file_id
            {
              type: 'file',
              fileId: file_id,
            }
          end

          # Get a link message hash value.
          #
          # @param content [String] Title text
          # @param link [String] Link text
          # @param url [String] Link url
          # @return [Hash]
          def link content, link, url
            {
              type: 'link',
              contentText: content,
              linkText: link,
              link: url
            }
          end

        end

      end
    end
  end
end
