%%%-------------------------------------------------------------------
%% @doc big_world public API
%% @end
%%%-------------------------------------------------------------------

-module(big_world_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    big_world_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
