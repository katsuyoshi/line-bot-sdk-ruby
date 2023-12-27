require 'spec_helper'
require 'webmock/rspec'
require 'json'

describe LineWorks::Bot::Message::Template do

  it 'get the text message' do
    message = 'Hello, world'
    response = LineWorks::Bot::Message::Template.text message

    expected = {
      type: 'text',
      text: message
    }
    expect(response).to eq(expected)
  end

  it 'get the stamp message' do
    package_id = 1
    sticker_id = 2
    response = LineWorks::Bot::Message::Template.stamp package_id, sticker_id

    expected = {
      type: 'sticker',
      packageId: '1',
      stickerId: '2'
    }
    expect(response).to eq(expected)
  end

  it 'get the image message with urls' do
    preview_url = 'https://example.com/image_preview.png'
    original_url = 'https://example.com/image.png'
    response = LineWorks::Bot::Message::Template.image original_url, preview_url

    expected = {
      type: 'image',
      originalContentUrl: original_url,
      previewImageUrl: preview_url
    }
    expect(response).to eq(expected)
  end

  it 'get the image message with only original url' do
    original_url = 'https://example.com/image.png'
    response = LineWorks::Bot::Message::Template.image original_url

    expected = {
      type: 'image',
      previewImageUrl: original_url,
      originalContentUrl: original_url,
    }
    expect(response).to eq(expected)
  end

  it 'get the image message with file id' do
    file_id = 'image_id'
    response = LineWorks::Bot::Message::Template.image_with_file file_id

    expected = {
      type: 'image',
      fileId: file_id
    }
    expect(response).to eq(expected)
  end

  it 'get the file message with url' do
    file_url = 'https://example.com/file.pdf'
    response = LineWorks::Bot::Message::Template.file file_url

    expected = {
      type: 'file',
      originalContentUrl: file_url,
    }
    expect(response).to eq(expected)
  end

  it 'get the file message with file id' do
    file_id = 'file_id'
    response = LineWorks::Bot::Message::Template.file_with_id file_id

    expected = {
      type: 'file',
      fileId: file_id
    }
    expect(response).to eq(expected)
  end

  it 'get the link message' do
    content = 'content'
    link = 'link'
    url = 'https://example.com'
    response = LineWorks::Bot::Message::Template.link content, link, url

    expected = {
      type: 'link',
      contentText: content,
      linkText: link,
      link: url
    }
    expect(response).to eq(expected)
  end

end
