system(Users, Name, InitialChatbotCodeLink, Chatbot, [Users, Name, InitialChatbotCodeLink, Chatbot]).

getChatbotSystem(System, Chatbot):-
    system(_,_,_,Chatbot,System).

setSystemChatbot(System,NewChatbot,NewSystem):-
    system(UsersS, NameS, InitialChatbotCodeLinkS, _, System),
    system(UsersS, NameS, InitialChatbotCodeLinkS, NewChatbot, NewSystem).

systemAddChatbot(System1, Chatbot, System2):-
    getChatbotSystem(System1,ListSystem),
    member(Chatbot,ListSystem),
    System2 = System1.
systemAddChatbot(System1, Chatbot, System2):-
    getChatbotSystem(System1,ListSystem),
    \+member(Chatbot,ListSystem),
    ListaModSC = [Chatbot|ListSystem],
    setSystemChatbot(System1,ListaModSC, System2).