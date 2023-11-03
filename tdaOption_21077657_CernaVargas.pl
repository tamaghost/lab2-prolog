option(CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

getMensajeOption(Option, Mensaje) :-
    option(_,Mensaje,_,_,_, Option).

getKeywordOption(Option, ListKeywords) :-
    option(_,_,_,_,ListKeywords, Option).

listaMensajeOption([], [], []).  % Caso base: cuando la lista está vacía, la lista de mensajes también es vacía.
listaMensajeOption([Cabeza|Cola], ListaMensajes) :-
    getMensajeOption(Cabeza, Mensaje),  % Obtener el mensaje de la cabeza
    listaMensajeOption(Cola, RestoMensajes),  % Llamada recursiva para procesar la cola
    ListaMensajes = [Mensaje | RestoMensajes].  % Construir la lista de mensajes