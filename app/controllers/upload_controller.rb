class UploadController < ApplicationController
  def newfile
    @filename ="#{Rails.root}/public/incoming/test.txt"
    send_file(@filename, :filename => "test.txt")
  end
  def new

  end
  def create
    name = params[:upload][:file].original_filename
    path = File.join("public", "incoming", name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    redirect_to "/upload/new"
  end
end
