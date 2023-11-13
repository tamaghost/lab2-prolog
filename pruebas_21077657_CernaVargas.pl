%Scrip de prueba N°1

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10,OP2,F11),
% flowAddOption(F10, OP1, F12),
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0),

option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3,OP4,OP5,OP6], F20),

option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7,OP8,OP9,OP10], F21),

option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11,OP12,OP13,OP14,OP15], F22),

chatbot(1, "Agencia Viajes", "Bienvenido\n¿Dónde quieres viajar?",1, [F20,F21,F22], CB1),

option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16,OP17,OP18], F30),

chatbot(2, "Orientador Académico", "Bienvenido\n¿Qué te gustaría estudiar?",1, [F30], CB2),

system([],"Chatbots Paradigmas", 0, [CB0], S0),

% systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),

user("user1", [], User1),
user("user2", [], User2),
user("user3", [], User3),

systemAddUser(S02, User1, S2),
systemAddUser(S2, User2, S3),
% systemAddUser(S3, User2, S4),
systemAddUser(S3, User3, S5),

% systemLogin(S5, User8, S6),
systemLogin(S5, User1, S7),
% systemLogin(S7, User2, S8),

systemLogout(S7,S9),

systemLogin(S9, User2, S10).

%Scrip de prueba propio

option(1, "1. Mi conexión a Internet es lenta", 1, 1, ["internet lento", "conexion lenta"], O1),
flow(1, "flujo1", [], F10),
flowAddOption(F10,O1,F13),

option(2, "2. No puedo conectarme a Internet.", 2, 1, ["sin conexion", "sin internet"], O2),
flow(2, "flujo2", [], F11),
flowAddOption(F11,O2,F14),

option(3, "3. Otro", 2, 1, ["estudiar", "aprender", "perfeccionarme"], O3),
flow(3, "flujo3", [], F12),
flowAddOption(F12,O3,F15),

chatbot(0, "Chatbot 0", "Hola! Estoy aquí para ayudarte con tu problema de Internet, ¿Tu problema esta relacionado con algunas de estas causas?", 1, [F13,F14], CB0),
chatbotAddFlow(CB0,F15,CB00),
/**/
option(4, "1. Fibra óptica", 1, 1, ["fibra optica"], O4),
flow(20, "flujo1", [O4], F20),

option(5, "2. DSL", 2, 1, ["DSL"], O5),
flow(21, "flujo2", [O5], F21),

option(6, "3. cable Ethernet", 2, 1, ["cable", "cable de internet"], O6),
flow(22, "flujo3", [O6], F22),

chatbot(1, "Chatbot 1", "Para solucionar problemas de velocidad lenta, primero necesito obtener más información. ¿Puedes decirme qué tipo de conexión tienes", 1, [F20,F21], CB1),
chatbotAddFlow(CB1,F22,CB10),
/**/
option(7, "1. ¿Estás intentando conectarte a través de Wi-Fi o una conexión por cable?", 2, 1, ["cable", "wifi"], O7),
flow(30, "flujo30", [O7], F30),

option(8, "2. ¿Qué dispositivo estás usando para intentar la conexión ?", 1, 1, ["router"], O8),
flow(31, "flujo31", [O8], F31),

option(9, "3. ¿Has tenido conexión a Internet en este dispositivo previamente?", 2, 1, ["Si", "si"], O9),
flow(32, "flujo32", [O9], F32),

chatbot(2, "Chatbot 2", "Para solucionar problemas de velocidad lenta, primero necesito obtener más información.", 1, [F30,F31], CB2),
chatbotAddFlow(CB2,F32,CB20),
/**/
chatbot(3, "Chatbot 3", "Te podremos en contacto con un especialista, por favor se pasiente.", 1, [], CB3),

option(10, "1. El problema persiste", 2, 1, ["1", "si"], O10),
flow(40, "flujo40", [O10], F40),
chatbot(4, "Chatbot 4", "Gracias por la información. ¿Has intentado reiniciar tu módem o router?", 1, [F40], CB4),

option(11, "1. El problema persiste", 2, 1, ["1", "si"], O11),
flow(41, "flujo40", [O11], F41),
chatbot(5, "Chatbot 5","Gracias por la información. Asegúrate de que todos los cables estén correctamente conectados. ", 1, [F40], CB5),

option(12, "1. El problema persiste", 2, 1, ["1", "si"], O12),
flow(42, "flujo40", [O12], F42),
chatbot(6, "Chatbot 6", "Te podremos en contacto con un especialista, por favor se pasiente.", 1, [F42], CB6),

chatbot(7, "Chatbot 7", "Te recomiendo que te pongas en contacto con tu proveedor de servicios de Internet, para informarles sobre la situación y pedirles que realicen una revisión de tu conexión.", 1, [F40, F41, F42], CB7),

user("user1", [], User1),
user("user2", [], User2),
user("user3", [], User3),

system([],"Chatbots Inicial", 0, [CB00, CB10, CB4], S0),
systemAddChatbot(S0,CB7,S1),
system([],"Chatbots Inicial", 0, [CB00, CB10, CB5], S2),
systemAddChatbot(S2,CB7,S3),
system([],"Chatbots Inicial", 0, [], S4),
systemAddChatbot(S4,CB3,S5),

systemAddUser(S1,User1,S6),
systemAddUser(S6,User2,S7),
systemAddUser(S7,User3,S8),

systemLogin(S8,User1,S9),
%systemLogin(S9,User1,S10),
systemLogout(S9,S11),
systemLogin(S8, User2,S12),
systemLogout(S12,S13).
%systemLogout(S9,S14).