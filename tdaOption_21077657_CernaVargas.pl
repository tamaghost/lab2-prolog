option(CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

getMensajeOption([_, Mensaje, _, _, _], Mensaje).

getKeywordOption(Option, ListKeywords) :-
    option(_,_,_,_,ListKeywords, Option).

listaMensajeOption([], []).  % Caso base: lista vacía
listaMensajeOption([Opcion|Resto], [Mensaje|RestoMensajes]) :-
    getMensajeOption(Opcion, Mensaje),  % Obtener el mensaje de la opción
    listaMensajeOption(Resto, RestoMensajes).  % Llamada recursiva para el resto de las opciones
