-module(tcp_server_sup).  
-behaviour(supervisor).  
-export([start_link/0, init/1]).  
  
-spec start_link() -> {ok, pid()}.  
start_link() ->  
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).  
  
  
%% init/1  
init([]) ->  
    {ok, {{one_for_one, 10, 10}, []}}.  