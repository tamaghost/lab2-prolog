%Dominio: num x string x list(option) x flow
%meta principal: flow/4
%meta secundaria: list_to_set/2
%Descripcion: Constructor de flow
flow(Id, NameMsg, Option,[Id, NameMsg, SinDuplicados]):-
    list_to_set(Option, SinDuplicados).

%Dominio: flow x num 
%meta principal: getIdFlow/2
%Descripcion: selector de id de flow
getIdFlow([ID, _, _], ID).

%Dominio: flow x string
%meta principal: getNameMsgFlow/2
%Descripcion: selector de mensaje de flow
getNameMsgFlow([_, Msg, _], Msg).

%Dominio: flow x list(option)
%meta principal: getOptionFlow/2
%Descripcion: selector de lista option de flow
getOptionFlow([_, _, Option], Option).

%Dominio: flow x option x flow
%meta principal: setOptionFlow/3
%meta secundaria: getIdFlow/2, getNameMsgFlow/2, flow/4
%Descripcion: modificador de lista option de flow
setOptionFlow(Flow,NewOption,FlowNew):-
    getIdFlow(Flow, ID),
    getNameMsgFlow(Flow, Msg),
    flow(ID, Msg, NewOption,FlowNew).

%Dominio: flow x list(option) x flow
%meta principal: flowAddOption/3
%meta secundaria: getOptionFlow/2, member/2
%Descripcion: agrega opcion a lista option de flow
flowAddOption(Flow1,Option,_):-
    getOptionFlow(Flow1,Opciones),
    member(Option,Opciones),
    false.
%Dominio: flow x list(option) x flow
%meta principal: flowAddOption/3
%meta secundaria: getOptionFlow/2, member/2, append/3, setOptionFlow/3
%Descripcion: agrega opcion a lista option de flow
flowAddOption(Flow1,Option,Flow2):-
    getOptionFlow(Flow1,Opciones),
    \+member(Option,Opciones),
    append(Opciones, [Option], ListOp),
    setOptionFlow(Flow1, ListOp, Flow2).
