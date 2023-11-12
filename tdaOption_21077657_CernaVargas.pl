%Dominio: num x string x num x num x list(string) x option
%meta principal: option/6
option(CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[CodeOp, Mensaje, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%Dominio: option x list(string)
%meta principal: getMensajeOption/2
getCodeOp([_, CodeOp, _, _, _], CodeOp).

%Dominio: option x list(string)
%meta principal: getMensajeOption/2
getMensajeOption([_, Mensaje, _, _, _], Mensaje).

%Dominio: option x list(string)
%meta principal: getKeywordOption/2
getKeywordOption([_, _, _, _, ListKeywords], ListKeywords).

%Dominio: option x num
%meta principal: getChatbotCodeLinkOption/2
getChatbotCodeLinkOption([_, _, ChatbotCodeLink, _, _], ChatbotCodeLink).

%Dominio: option x list
%meta principal: getInitialFlowCodeLinkOption/2
getInitialFlowCodeLinkOption([_, _, _, InitialFlowCodeLink, _], InitialFlowCodeLink).



