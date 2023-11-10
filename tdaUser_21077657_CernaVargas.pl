user(NombreUser, ChatHistory,[NombreUser, ChatHistory]).

getChatHistoryUser(User, Chat):-
    system(_,Chat,User).

setChatHistoryUser(User,NewChat,NewUser):-
    system(Usuario,_,User).
    system(Usuario,NewChat,NewUser).

