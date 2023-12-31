%Dominio: num x string x string x num x list(flow) x chatbot
%meta principal: chatbot/6
%meta secundaria: list_to_set/2
%Descripcion: Constructor de chatbot
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows,[ChatbotID, Name, WelcomeMessage, StartFlowId, SinDuplicados]):-
    list_to_set(Flows, SinDuplicados).

%Dominio: chatbot x num 
%meta principal: getIdChatbot/2
%Descripcion: selector de ChatbotID de chatbot
getIdChatbot([ChatbotID,_,_,_,_], ChatbotID).

%Dominio: chatbot x string
%meta principal: getNameChatbot/2
%Descripcion: selector de Name de chatbot
getNameChatbot([_,Name,_,_,_], Name).

%Dominio: chatbot x string
%meta principal: getMessageChatbot/2
%Descripcion: selector de Message de chatbot
getMessageChatbot([_,_,Message,_,_], Message).

%Dominio: chatbot x num 
%meta principal: getStartFlowChatbot/2
%Descripcion: selector de StartFlow de chatbot
getStartFlowChatbot([_,_,_,StartFlow,_], StartFlow).

%Dominio: chatbot x list(flow)
%meta principal: getFlowChatbot/2
%Descripcion: selector de lista Flow de chatbot
getFlowChatbot([_,_,_,_,Flow], Flow).

%Dominio: chatbot x flow x chatbot
%meta principal: setFlowChatbot/3
%meta secundaria: getIdChatbot/2, getNameChatbot/2, getMessageChatbot/2, getStartFlowChatbot/2, chatbot/6
%Descripcion: modificador de lista flow de chatbot
setFlowChatbot(Chatbot,NewFlow,NewChatbot):-
    getIdChatbot(Chatbot, ChatbotID),
    getNameChatbot(Chatbot, Name),
    getMessageChatbot(Chatbot, Message),
    getStartFlowChatbot(Chatbot, StartFlow),
    chatbot(ChatbotID, Name, Message, StartFlow, NewFlow, NewChatbot).

%Dominio: chatbot x list(flow) x chatbot
%meta principal: chatbotAddFlow/3
%meta secundaria: getFlowChatbot/2, member/2
%Descripcion: agrega flow a lista flow de chatbot
chatbotAddFlow(Chatbot1, Flow, _) :-
    getFlowChatbot(Chatbot1, ListFlow),
    member(Flow, ListFlow),
    false.
%Dominio: chatbot x list(flow) x chatbot
%meta principal: chatbotAddFlow/3
%meta secundaria: getFlowChatbot/2, member/2, append/2, setFlowChatbot/3
%Descripcion: agrega flow a lista flow de chatbot
chatbotAddFlow(Chatbot1, Flow, Chatbot2) :-
    getFlowChatbot(Chatbot1, ListFlow),
    \+ member(Flow, ListFlow),
    append(ListFlow, [Flow], ListaModCF),
    setFlowChatbot(Chatbot1, ListaModCF, Chatbot2).

