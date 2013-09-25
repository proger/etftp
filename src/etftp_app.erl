-module(etftp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, run/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    etftp_sup:start_link().

stop(_State) ->
    ok.

run(Path) ->
    inets:start(tftpd, [{debug, all}, {callback, {".*", tftp_file, [{root_dir, Path}]}}], inets).
