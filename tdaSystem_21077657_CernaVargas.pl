%Dominio: list(user) x string x num x list(chatbot) x system
%meta principal: system/5
%meta secundaria: list_to_set/2
%Descripcion: Constructor de system
system(Users, Name, InitialChatbotCodeLink, Chatbot, [Users, Name, InitialChatbotCodeLink, SinDuplicados]):-
    list_to_set(Chatbot, SinDuplicados).

%Dominio: system x list(user)
%meta principal: getUserSystem/2
%Descripcion: selector de User de system
getUserSystem([User,_,_,_], User).

%Dominio: system x string
%meta principal: getNameSystem/2
%Descripcion: selector de Name de system
getNameSystem([_,Name,_,_], Name).

%Dominio: system x num
%meta principal: getChatbotCodeLinkSystem/2
%Descripcion: selector de ChatbotCode de system
getChatbotCodeLinkSystem([_,_,ChatbotCode,_], ChatbotCode).

%Dominio: system x list(chatbot)
%meta principal: getChatbotSystem/2
%Descripcion: selector de Chatbot de system
getChatbotSystem([_,_,_,Chatbot], Chatbot).

%Dominio: system x chatbot x system
%meta principal: setChatbotSystem/3
%meta secundaria: getUserSystem/2, getNameSystem/2, getChatbotCodeLinkSystem/2, system/5
%Descripcion: modificador de lista chatbot de system
setChatbotSystem(System,NewChatbot,NewSystem):-
    getUserSystem(System, User),
    getNameSystem(System, Name),
    getChatbotCodeLinkSystem(System, ChatbotCode),
    system(User, Name, ChatbotCode, NewChatbot, NewSystem).

%Dominio: system x user x system
%meta principal: setSystemUser/3
%meta secundaria: getNameSystem/2, getChatbotCodeLinkSystem/2, getChatbotSystem/2, system/5
%Descripcion: modificador de lista user de system
setSystemUser(System,NewUser,NewSystem):-
    getNameSystem(System, Name),
    getChatbotCodeLinkSystem(System, ChatbotCode),
    getChatbotSystem(System, Chatbot),
    system(NewUser, Name, ChatbotCode, Chatbot, NewSystem).

%Dominio: system x list(chatbot) x system
%meta principal: systemAddChatbot/3
%meta secundaria: getChatbotSystemt/2, member/2
%Descripcion: agrega chatbot a lista chatbots de system
systemAddChatbot(System1, Chatbot, _):-
    getChatbotSystem(System1,ListSystem),
    member(Chatbot,ListSystem),
    false.
%Dominio: system x list(chatbot) x system
%meta principal: systemAddChatbot/3
%meta secundaria: getFlowChatbot/2, member/2, setChatbotSystem/3
%Descripcion: agrega chatbot a lista chatbots de system
systemAddChatbot(System1, Chatbot, System2):-
    getChatbotSystem(System1,ListSystem),
    \+member(Chatbot,ListSystem),
    ListaModSC = [Chatbot|ListSystem],
    setChatbotSystem(System1,ListaModSC, System2).

%Dominio: system x list(user) x system
%meta principal: systemAddUser/3
%meta secundaria: getUserSystem/2, member/2
%Descripcion: agrega user a lista users de system
systemAddUser(System, User, _):-
    getUserSystem(System, ListUsers),
    member(User,ListUsers),
    false.
%Dominio: system x list(user) x system
%meta principal: systemAddUser/3
%meta secundaria: getUserSystem/2, member/2, append/3, setSystemUser/3
%Descripcion: agrega user a lista users de system
systemAddUser(System, User, NewSystem):-
    getUserSystem(System, ListUsers),
    \+member(User,ListUsers),
    append(ListUsers, [User], ListU),
    setSystemUser(System,ListU,NewSystem).

%Dominio: system x list(user) x system
%meta principal: systemLogin/3
%meta secundaria: getUserSystem/2, member/2
%Descripcion: agrega user a lista users de system, si no pertenece a la lista
systemLogin(System, User, _):-
    getUserSystem(System, ListUsers),
    \+member(User,ListUsers),
    false.
%Dominio: system x list(user) x system
%meta principal: systemLogin/3
%meta secundaria: systemaLogueado/1, getUserSystem/2, member/2, setSystemUser/3
%Descripcion: agrega user a lista users de system, si no pertenece a la lista
systemLogin(System, User, SystemLogin):-
    \+systemaLogueado(System),
    getUserSystem(System, ListUsers),
    member(User,ListUsers),
    setSystemUser(System, [User|ListUsers], SystemLogin).

%caso base
contarUsuario(_, [], 0).
%Dominio: user x list(user) x num
%meta principal: contarUsuario/3
%meta secundaria: contarUsuario/3
%Descripcion: cuenta las recurrencias de una lista
contarUsuario(User, [User|Resto], Resultado) :-
    contarUsuario(User, Resto, ResultadoAnterior),
    Resultado is ResultadoAnterior + 1.
%Dominio: user x list(user) x num
%meta principal: contarUsuario/3
%meta secundaria: contarUsuario/3
%Descripcion: cuenta las recurrencias de una lista
contarUsuario(User, [_|Resto], Resultado) :-
    contarUsuario(User, Resto, Resultado).

%Dominio: system 
%meta principal: systemaLogueado/1
%meta secundaria: getUserSystem/2, contarUsuario/3
%Descripcion: verifica que un usuraio logueado solo se encuentra 2 veces en la lista user
systemaLogueado(System) :-
    getUserSystem(System, ListUsers),
    contarUsuario(_, ListUsers, Resultado), 
    Resultado == 2.

%Dominio: system x system
%meta principal: systemLogout/1
%meta secundaria: getUserSystem/2, select/3, setSystemUser/3
%Descripcion: elimina la recurrencia(correspondiente al primer elemento) en la lista user
systemLogout(System,SystemLogout):-
    getUserSystem(System, ListUsers),
    select(User1, ListUsers, NewListUsers),
    setSystemUser(System,NewListUsers,SystemLogout).