:- module(larkc_api, [foo/1, my_cl_eval/2]).

:- set_setting(pengines:slave_limit, -1).
:- set_setting(pengines:allow_from, ['127.0.0.1', localhost]).

foo(X) :-
	writeln(X).

my_cl_eval(Item,Result) :-
	user:cl_eval(Item,Result).

:- multifile sandbox:safe_primitive/1.

sandbox:safe_primitive(larkc_api:my_cl_eval(_, _)).
sandbox:safe_primitive(system:cl_eval(_, _)).
