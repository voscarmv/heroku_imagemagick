class UploadController < ApplicationController
  def newfile
  end
  def new

  end
  def create
    name = params[:upload][:file].original_filename
    path = File.join("public", "incoming", name)
    puts "LALALALA"
    puts name
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    redirect_to "/upload/new"
  end
end
