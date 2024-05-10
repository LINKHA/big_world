%%%-------------------------------------------------------------------
%% @doc net public API
%% @end
%%%-------------------------------------------------------------------

-module(net_app).
-include("ekcp.hrl").
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, _} = ranch:start_listener(tcp_reverse,
      ranch_tcp, #{socket_opts => [{port, 5555}]},
      reverse_protocol, []),

    ?TAB = ets:new(?TAB, [
      ordered_set, public, named_table]),
    ekcp_sup:start_link(),
    http_sup:start_link(),
    {ok, Connection} = eredis:start_link("localhost", 36379, [{password, "G62m50oigInC30sf"}]),
    {ok, Result} = eredis:q(Connection, ["SET", "mykey", "Hello"]),
    net_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
