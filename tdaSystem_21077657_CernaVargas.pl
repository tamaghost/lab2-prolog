system(Users, Name, InitialChatbotCodeLink, Chatbot, ChatHistory, [Users, Name, InitialChatbotCodeLink, Chatbot, ChatHistory]).

getUserSystem(System, User):-
    system(User,_,_,_,_,System).

setSystemUser(System,NewUser,NewSystem):-
    system(_, NameS, InitialChatbotCodeLinkS, ChatbotS, ChatHistoryS, System),
    system(NewUser, NameS, InitialChatbotCodeLinkS, ChatbotS, ChatHistoryS, NewSystem).

/*...*/

getChatbotSystem(System, Chatbot):-
    system(_,_,_,Chatbot,_,System).

setChatbotSystem(System,NewChatbot,NewSystem):-
    system(UsersS, NameS, InitialChatbotCodeLinkS,_, ChatHistoryS, System),
    system(UsersS, NameS, InitialChatbotCodeLinkS, NewChatbot, ChatHistoryS, NewSystem).

getChatHistorySystem(System, Chat):-
    system(_,_,_,_,Chat,System).

setChatHistorySystem(System,NewChat,NewSystem):-
    system(UsersS, NameS, InitialChatbotCodeLinkS, Chatbot, _, System),
    system(UsersS, NameS, InitialChatbotCodeLinkS, Chatbot, NewChat, NewSystem).
    
%funciona
systemAddChatbot(System1, Chatbot, System2):-
    getChatbotSystem(System1,ListSystem),
    member(Chatbot,ListSystem),
    System2 = System1.
systemAddChatbot(System1, Chatbot, System2):-
    getChatbotSystem(System1,ListSystem),
    \+member(Chatbot,ListSystem),
    ListaModSC = [Chatbot|ListSystem],
    setSystemChatbot(System1,ListaModSC, System2).


%funciona
systemAddUser(System, User, NewSystem):-
    getUserSystem(System, ListUsers),
    \+member(User,ListUsers),
    NewSystem = [User|System].
%funciona
systemLogin(System, User, SystemLogin):-
    getUserSystem(System, ListUsers),
    \+member(User,ListUsers),
    write("no es posible iniciar secion").
systemLogin(System, User, SystemLogin):-
    getUserSystem(System, ListUsers),
    member(User,ListUsers),
    NewListUsers = [User|ListUsers],
    setSystemUser(System, NewListUsers, SystemLogin).

%funciona pero no se que tan util sea
contarUsuario(_, [], 0).
contarUsuario(User, [User|Resto], Resultado) :-
    contarUsuario(User, Resto, ResultadoAnterior),
    Resultado is ResultadoAnterior + 1.
contarUsuario(User, [_|Resto], Resultado) :-
    contarUsuario(User, Resto, Resultado).
%funciona pero no se que tan util sea
esSystemaLogin(System) :-
    getUserSystem(System, ListUsers), % Asegúrate de que getUserSystem esté definido y funcione correctamente
    contarUsuario(_, ListUsers, Resultado), % Busca cualquier usuario en la lista
    Resultado == 2. % Verifica si se encontró al menos uno
