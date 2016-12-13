#
class Barcode < ApplicationRecord
  require 'barby'
  require 'barby/barcode/code_39'
  require 'barby/outputter/png_outputter'
  require 'kramdown'
  require 'pdfkit'

Kramdown::Document.new(text).to_html

  def generate_barcode(value = nil)
    barcode_value = value
    full_path = "/home/x/Desktop/barcode_#{barcode_value}.png"
    barcode = Barby::Code39.new(barcode_value)
    File.open(full_path, "w:ASCII-8BIT") { |f| f.write barcode.to_png(:margin => 3, :xdim => 2, :height => 55)}

    image = MiniMagick::Image.open(full_path)
    image.rotate "-90"
    image.flip
    image.write("/home/x/Desktop/barcode_#{barcode_value}r.png")
    output = source.sub(/\.md$/, '.pdf')
    html = Kramdown::Document.new('/home/x/Desktop/shippinglabel.html').to_html
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.to_file(File.join('/home/x/Desktop/', 'doc', output))
  end
end
