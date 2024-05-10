-module(mongo_example).
-export([test_mongo/0]).

test_mongo() ->
    %% 创建到 MongoDB 的连接
    % Args = #{database => <<"your_database_name">>,
    %      login => <<"mongo_user">>,
    %      password => <<"PXDN93VRKUm8TeE7">>,
    %      host => <<"localhost">>,
    %      port => 27017,
    %      auth_source => <<"admin">>,  % 鉴权数据库，默认为admin
    %      w_mode => safe,             % 写入模式
    %      r_mode => master,           % 读取模式
    %      pool_size => 1}.

    {ok, Connection} = mc_worker_api:connect([{database, <<"test">>}, 
                                         {login, <<"mongo_user">>},
                                         {password, <<"PXDN93VRKUm8TeE7">>},
                                         {host, "localhost"},
                                         {port, 27017},
                                         {auth_source, <<"admin">>},  % 鉴权数据库，默认为admin
                                         {w_mode, safe},
                                         {r_mode, master},
                                         {pool_size, 1}]).
    % Collection = <<"test">>,
    % %% 准备要插入的文档数据
    % Doc = #{<<"name">> => <<"John Doe">>, <<"age">> => 30},

    % %% 将文档插入到集合中
    % ok = mc_worker_api:insert(Connection, Collection, [Doc]),

    % %% 查询文档
    % {ok, Cursor} = mc_worker_api:find(Connection, Collection, #{<<"name">> => <<"John Doe">>}),
    % Results = mongo_cursor:rest(Cursor),

    % %% 输出查询结果
    % io:format("Query results: ~p~n", [Results]),

    % %% 更新数据（可选）
    % Update = #{<<"$set">> => #{<<"age">> => 31}},
    % ok = mc_worker_api:update(Connection, Collection, #{<<"name">> => <<"John Doe">>}, Update),

    % %% 删除数据（可选）
    % ok = mc_worker_api:delete(Connection, Collection, <<"your_collection_name">>, #{<<"name">> => <<"John Doe">>}),

    % %% 关闭连接
    % ok = mc_worker_api:stop(Connection),

    % Results.
