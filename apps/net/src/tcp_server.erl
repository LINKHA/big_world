-module(tcp_server).  
-behaviour(application).  
-export([start/2, stop/1]).  
  
%% start/2  
start(_Type, _StartArgs) ->  
    {ok, _Pid} = ranch:start_listener(tcp_reverse, 1,  
        ranch_tcp, [{port, 5555},{max_connections, 10240}], game_protocol, []),  
    tcp_server:start_link().  
  
  
%% stop/1  
stop(State) ->  
    ok.  