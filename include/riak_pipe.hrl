-record(fitting,
        {
          pid :: pid(),
          ref :: reference() | undefined,
          chashfun :: riak_pipe_vnode:chashfun() |undefined,
          nval :: riak_pipe_vnode:nval() | undefined
        }).

-record(fitting_details,
        {
          fitting :: #fitting{},
          name :: term(),
          module :: atom(),
          arg :: term() | undefined,
          output :: #fitting{},
          options :: riak_pipe:exec_opts(),
          q_limit :: pos_integer()
        }).

-record(fitting_spec,
        {
          name :: term(),
          module :: atom(),
          arg :: term() |undefined,
          chashfun = {chash, key_of} :: riak_pipe_vnode:chashfun(),
          nval = 1 :: riak_pipe_vnode:nval(),
          q_limit = 64 :: pos_integer()
        }).

-record(pipe,
        {
          builder :: pid(),
          fittings :: [{Name::term(), #fitting{}}],
          sink :: #fitting{}
        }).

-record(pipe_result,
        {
          ref,
          from,
          result
        }).

-record(pipe_eoi,
        {
          ref
        }).

-record(pipe_log,
        {
          ref,
          from,
          msg
        }).
