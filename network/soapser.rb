require "soap/rpc/standaloneServer"

begin
  class ServerClass < SOAP::RPC::StandaloneServer
    def initialize(*args)
      super(args[0], args[1], args[2], args[3])
      add_method(self, 'sum', 'a', 'b')
      add_method(self, 'dif', 'a', 'b')
    end
    
    def sum(a, b)
      return a.to_i + b.to_i
    end
    def dif(a, b)
      return a.to_i - b.to_i
    end
  end
  server = ServerClass.new("MyServer",
                        'urn:ruby:mathcalc', 'localhost', 9900)
  trap('INT') {
    server.shutdown
  }
  server.start
  rescue => err
  puts err.message
end
