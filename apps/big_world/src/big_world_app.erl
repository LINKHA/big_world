%%%-------------------------------------------------------------------
%% @doc big_world public API
%% @end
%%%-------------------------------------------------------------------

-module(big_world_app).

-behaviour(application).

-export([start/2, stop/1]).

-include("x.hrl").

encode_person() ->
    Person = #'Person'{name = <<"Alice">>, id = 123, email = <<"alice@example.com">>},
    x:encode_msg(Person).

decode_person(Bin) ->
    x:decode_msg(Bin, 'Person').

start(_StartType, _StartArgs) ->
    io:format("qwewqe 1--------------- ~n"),
    Bin = encode_person(),
        io:format("qwewqe 11--------------- ~n"),
    Persion = decode_person(Bin),
    io:format("qwewqe 2--------------- ~p~n", [Persion]),
    big_world_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
