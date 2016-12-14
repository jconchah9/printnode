#
class Barcode < ApplicationRecord
  require 'barby'
  require 'barby/barcode/code_39'
  require 'barby/outputter/png_outputter'

  def initialize(barcode_value = nil)
    @barcode_value = barcode_value
    # @file_pdf_save_path = '/home/x/Desktop/'
    @file_barcode_save_path = './app/assets/images/'
    # @source_html = '/home/x/Desktop/shippinglabel.html'
    # @source_html = 'http://localhost:3000/printers'
    @file_name
  end

  def barcode
    @file_name
  end

  def value
    @barcode_value
  end

  def generate_barcode(value)
    @barcode_value = value
    @file_name = "barcode_#{value}.png"
    full_path = @file_barcode_save_path + @file_name
    barcode = Barby::Code39.new(value)
    File.open(full_path, 'w:ASCII-8BIT') { |f| f.write barcode.to_png(:margin => 3, :xdim => 2, :height => 55)}
    image = MiniMagick::Image.open(full_path)
    image.rotate '-90'
    image.flip
    image.write(full_path)
  end

  # def generate_file_pdf
  #   # source html para generar pdf
  #   # pdf = WickedPdf.new.pdf_from_html_file(@source_html)
  #   pdf = WickedPdf.new.pdf_from_html_file('./views/printes/index')
  #   name_file = 'shippingLabel_' + @barcode_value + '.pdf'
  #   # source-end para guardar el pdf generado
  #   save_path = Rails.root.join(@file_pdf_save_path, name_file)
  #   File.open(save_path, 'wb') do |file|
  #     file << pdf
  #   end
  # end
end
