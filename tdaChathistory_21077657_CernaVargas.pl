chatHistory(Usuario, StringUser, Chatbot, StringChatbot, Fecha, Hora,[Usuario, StringUser, Chatbot, StringChatbot, Fecha, Hora]).

setStringUserChatHistory(Chat, NewStringUser, NewChat):-
    chatHistory(Usuario,_, Chatbot, StringChatbot, Fecha, Hora, Chat),
    chatHistory(Usuario, NewStringUser, Chatbot, StringChatbot, Fecha, Hora, NewChat).