-module(http_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Port = 8080,
    Dispatch = cowboy_router:compile([
                {'_', [
                    {"/", hello_handler, []}
                ]}
              ]),
    {ok, _} = cowboy:start_clear(my_http_listener, [
                {port, Port}
            ], #{
                env => #{dispatch => Dispatch}
            }),
    {ok, {{one_for_one, 5, 10}, []}}.
