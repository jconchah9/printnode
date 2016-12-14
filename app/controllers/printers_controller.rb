#
class PrintersController < ApplicationController
  def show
    barcode = Barcode.new
    generar = barcode.generate_barcode('12345')
    @barcode = barcode.barcode
    value = barcode.value
    respond_to do |format|
      format.html
      format.pdf{ render template: 'printers/shipping', pdf: "shipping_#{value}" }
    end
  end
end
