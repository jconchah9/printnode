class PrintersController < ApplicationController

 Mime::Type.register "application/pdf", :pdf
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end
end
