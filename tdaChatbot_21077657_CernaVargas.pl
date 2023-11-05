chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows,[ChatbotID, Name, WelcomeMessage, StartFlowId, Flows]).

getFlowChatbot(Chatbot, Flow):-
    chatbot(_,_,_,_,Flow,Chatbot).

setFlowChatbot(Chatbot,NewFlow,NewChatbot):-
    chatbot(ChatbotIDC, NameC, WelcomeMessageC, StartFlowIdC, _,Chatbot),
    chatbot(ChatbotIDC, NameC, WelcomeMessageC, StartFlowIdC, NewFlow,NewChatbot).

chatbotAddFlow(Chatbot1, Flow, Chatbot2) :-
    getFlowChatbot(Chatbot1, ListFlow),
    member(Flow, ListFlow),
    Chatbot2 = Chatbot1.
chatbotAddFlow(Chatbot1, Flow, Chatbot2) :-
    getFlowChatbot(Chatbot1, ListFlow),
    \+ member(Flow, ListFlow),
    append(ListFlow, [Flow], ListaModCF),
    setFlowChatbot(Chatbot1, ListaModCF, Chatbot2).
