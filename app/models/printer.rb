class Printer < ApplicationRecord
include HTTParty

base_uri 'https://api.printnode.com'

def initialize(service=nil, page=nil)
 @options =  { username: 'test.37326', password: '6498685d17b84c225b87f3f273a2c2ce82a816c6' }
end

def whoami
  self.class.get('/whoami',basic_auth: @options)
end

def computers
  self.class.get('/computers',basic_auth: @options)
end
def printers
  self.class.get('/printers',basic_auth: @options)
end
def computersPrinters (computer,printer)
  self.class.get('/computers/'+computer.to_s+'/printers/'+printer.to_s,basic_auth: @options)
end

def printjobs
  binding.pry
  self.class.post('/printjobs',body:{'printerId': 194561,'title': 'test','contentType': 'raw_uri','content': 'hello ','source': 'api documentation!' },basic_auth: @options)
end





end
