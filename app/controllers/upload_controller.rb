class UploadController < ApplicationController
  # @name = nil
  def newfile
    # @filename ="#{Rails.root}/public/incoming/test.txt"
    # send_file(@filename, :filename => "test.txt")

    # text = "Hello, world!"
    # text = session[:contenido]
    # puts text
    send_data(session[:contenido], filename: "out.txt")
  end
  def new

  end
  def create
    @name = params[:upload][:file].read
    # send_data(@name, filename: "out.txt")
    # path = File.join("public", "incoming", "test.txt")
    # File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    # flash[:notice] = "File uploaded"
    session[:contenido] = nil
    session[:contenido] = @name
    redirect_to action: :newfile
  end
end
