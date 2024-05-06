%%%-------------------------------------------------------------------
%% @doc net top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(net_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    % ChildSpecs = [
    %     #{
    %         id => tcp_reverse_app, 
    %         start => {tcp_reverse_app, start, [?MODULE, []]},
    %         shutdown => 5000, 
    %         type => worker, 
    %         modules => [tcp_reverse_app]}
    %     ],
    ChildSpecs = [],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
