%Dominio: string x ChatHistory x user
%meta principal: user/3
%Descripcion: Constructor de user
user(NombreUser, ChatHistory,[NombreUser, ChatHistory]).

%Dominio: user x list(ChatHistory)
%meta principal: getUserUser/2
%Descripcion: selector de id de user
getUserUser([Id,_], Id).

%Dominio: user x list(ChatHistory)
%meta principal: getChatHistoryUser/2
%Descripcion: selector de ChatHistory de user
getChatHistoryUser([_,Chat], Chat).

%Dominio: user x ChatHistory x user
%meta principal: setChatHistoryUser/3
%meta secundaria: getChatHistoryUser/2, user/3
%Descripcion: modificador de lista ChatHistory de user
setChatHistoryUser(User,NewChat,NewUser):-
    getChatHistoryUser([_,Chat], Chat),
    user(User, Chat, NewUser).

