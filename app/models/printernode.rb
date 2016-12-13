class Printernode < ApplicationRecord
  require 'printnode'

  def initialize(api_key = '6498685d17b84c225b87f3f273a2c2ce82a816c6')
    @auth = PrintNode::Auth.new(api_key)
  end

  def method_name(api_key = niñ)
    @auth = PrintNode::Auth.new(api_key)
  end

  def client
    @client = PrintNode::Client.new(@auth)
  end

  def whoami
    @whoami = client.whoami
  end

  def computers(id = nil)
    @computer = client.computers(id)
  end

  def printers(computer_id = nil, printer_id = nil)
    @printer = client.printers(computer_id, printer_id)
  end

  def printjob(printer_id = nil, title = nil, content_type = nil, content = nil, source = nil,qty = nil)
    client.create_printjob({'printerId': printer_id, 'title': title, 'contentType': content_type, 'content': content, 'source': source}, {'qty': qty})
  end

end
