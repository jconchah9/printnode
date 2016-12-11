class Barcode < ApplicationRecord
  require 'barby'
  require 'barby/barcode/code_39'
  require 'barby/outputter/png_outputter'

  def generateBarcode
    barcode_value = '099999333'
    full_path = "/home/x/Desktop/barcode_#{barcode_value}.png"
    barcode = Barby::Code39.new(barcode_value)
    File.open(full_path, "w:ASCII-8BIT") { |f| f.write barcode.to_png(:margin => 3, :xdim => 2, :height => 55)}
  end


end
