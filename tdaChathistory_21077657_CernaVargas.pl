%Dominio: string x string x Chatbot x string x string
%meta principal: chatHistory/6
%Descripcion: Constructor de chatHistory
chatHistory(Usuario, StringUser, Chatbot, StringChatbot, FechaHora,[Usuario, StringUser, Chatbot, StringChatbot, FechaHora]).

%Dominio: ChatHistory x string x ChatHistory
%meta principal: setStringUserChatHistory/3
%meta secundaria: chatHistory/6, chatHistory/6
%Descripcion: modificador de lista ChatHistory de user
setStringUserChatHistory(Chat, StringUser, NewChat):-
    chatHistory(Usuario,_, Chatbot, StringChatbot, FechaHora, Chat),
    chatHistory(Usuario, NewStringUser, Chatbot, StringChatbot, FechaHora, NewChat).