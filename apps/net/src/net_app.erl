%%%-------------------------------------------------------------------
%% @doc net public API
%% @end
%%%-------------------------------------------------------------------

-module(net_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, _} = ranch:start_listener(tcp_reverse,
		ranch_tcp, #{socket_opts => [{port, 5555}]},
		reverse_protocol, []),
    net_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
