class UploadController < ApplicationController
  # helpers Sinatra::Streaming

  # class << self
  #   def stream(method, path, opts = {}, &block)
  #     send(method, path, opts) do
  #       stream do |out|
  #         timer = EventMachine::PeriodicTimer.new(10) { out << "\0" }
  #         out << instance_eval(&block)
  #         timer.cancel
  #       end
  #     end
  #   end
  # end

  # @name = nil
  def newfile
    # @filename ="#{Rails.root}/public/incoming/test.txt"
    # send_file(@filename, :filename => "test.txt")

    # text = "Hello, world!"
    # text = session[:contenido]
    # puts text
    path = session[:contenido]
    # output = session[:contenido]
    # File.basename(output,File.extname(output))
    t = Tempfile.new('saved', Rails.root.join('tmp'))
    t.binmode
    output = t.path

    # stream :get, '/test_stream' do
    # system("convert -density 300x300 -compress lzw -quality 1 #{path} #{output} &")
    # f = File.open(output, "rb")
    
    send_data(`convert -density 300x300 -compress lzw -quality 1 #{path} - &`, filename: "out.pdf")
        # sleep 40
      # 'done'
    # end

  end
  def new

  end
  def create
    # file_content = params[:upload][:file].read
    # puts params[:upload][:file].methods
    # send_data(@name, filename: "out.txt")
    # path = File.join("public", "incoming", "test.txt")
    # File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    # flash[:notice] = "File uploaded"

    # temporal = Tempfile.open("wb"){ |f| 
    #   f.write(params[:upload][:file].read)
    # }    
# 
    # StringIO(str="", "wb"){ |f|
    #   f.write(params[:upload][:file].read) 
    # }

    t = Tempfile.new('saved', Rails.root.join('tmp'))
    t.binmode
    t.write(params[:upload][:file].read)

    session[:contenido] = nil
    session[:contenido] = t.path
    redirect_to action: :newfile
  end
end
