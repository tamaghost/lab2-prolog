%Dominio: num x string x num x num x list(string) x option
%meta principal: option/6
%Descripcion: Constructor de option
option(CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%Dominio: option x list(string)
%meta principal: getMensajeOption/2
%Descripcion: selector de mensaje de option
getMensajeOption([_, Mensaje, _, _, _], Mensaje).

%Dominio: option x list(string)
%meta principal: getKeywordOption/2
%Descripcion: selector de listaKeywords de option
getKeywordOption([_, _, _, _, ListKeywords], ListKeywords).

%Dominio: option x num
%meta principal: getChatbotCodeLinkOption/2
%Descripcion: selector de ChatbotCodeLink de option
getChatbotCodeLinkOption([_, _, ChatbotCodeLink, _, _], ChatbotCodeLink).

%Dominio: option x list
%meta principal: getInitialFlowCodeLinkOption/2
%Descripcion: modificador de flow de option
getInitialFlowCodeLinkOption([_, _, _, InitialFlowCodeLink, _], InitialFlowCodeLink).



