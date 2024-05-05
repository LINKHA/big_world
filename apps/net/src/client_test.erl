-module(client_test).  
  
-export([send/1]).  
  
send(BinMsg) ->  
    SomeHostInNet = "localhost",   
    {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5555,  
                                 [binary, {packet, 2}]),  
    ok = gen_tcp:send(Sock, BinMsg),  
    receive  
        {tcp,Socket,String} ->  
            gen_tcp:close(Socket)  
        after 60000 ->  
            exit          
    end,  
    ok = gen_tcp:close(Sock).  