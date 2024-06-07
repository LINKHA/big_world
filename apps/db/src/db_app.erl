%%%-------------------------------------------------------------------
%% @doc db public API
%% @end
%%%-------------------------------------------------------------------

-module(db_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    % 单节点部署方式
    % {ok, Connection} = eredis:start_link("localhost", 6379, [{}]),
    % 哨兵部署方式
    % SentinelOptions = [{master_group, mymaster},
    %         {endpoints, [
    %             {"localhost", 26379},
    %             {"localhost", 26380},
    %             {"localhost", 26381}    
    %     ]}],
    % {ok, Connection} = eredis:start_link([{sentinel, SentinelOptions}]),

    % {ok, Result} = eredis:q(Connection, ["SET", "mykey", "Hello"]),
    mongo_example:ex_test_mongo(),

    db_sup:start_link().

stop(_State) ->
    ok.

get_date() ->
    ok.
%% internal functions
