big_world
=====

An OTP application

Build
-----

    $ rebar3 compile

rebar3 new umbrella big_world
rebar3 new app xxx

1. 创建bigworld_net网桥:

   ```shell
   docker network create bigworld_net
   ```

2. 启动中间件容器:

   ```shell
   docker-compose -f docker-compose-env.yml up -d
   ```