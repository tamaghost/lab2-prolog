flow(Id, NameMsg, Option,[Id, NameMsg, Option]).

getOptionFlow(Flow, Option) :-
    flow(_, _, Option, Flow).

setOptionFlow(Flow,NewOption,FlowNew):-
    flow(IdF,NameMsgF,_,Flow),
    flow(IdF,NameMsgF,NewOption,FlowNew).

flowAddOption(Flow1,Option,Flow2):-
    getOptionFlow(Flow1,Opciones),
    member(Option,Opciones),
    Flow2 = Flow1.
flowAddOption(Flow1,Option,Flow2):-
    getOptionFlow(Flow1,Opciones),
    \+member(Option,Opciones),
    ListaModFP = [Option|Opciones],
    setOptionFlow(Flow1,ListaModFP,Flow2).
