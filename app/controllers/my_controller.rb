module Application
  module Controllers
    class UploadController < Sinatra::Base
      helpers Sinatra::Streaming

      class << self
        def stream(method, path, opts = {}, &block)
          send(method, path, opts) do
            stream do |out|
              timer = EventMachine::PeriodicTimer.new(10) { out << "\0" }
              out << instance_eval(&block)
              timer.cancel
            end
          end
        end
      end
      
      stream :get, '/test_stream' do
        # do the long-running stuff here
        sleep 40
        'done'
      end
    end
  end
end