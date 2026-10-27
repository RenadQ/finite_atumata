grammar PacManDFA;

U : 'U';
D : 'D';
L : 'L';
R : 'R';
E : 'E';
G : 'G';
P : 'P';
F : 'F';
T : 'T';
AllDotsEaten : 'AllDotsEaten';
Restart : 'Restart';
GhostStart : 'GhostStart';
SeePac : 'SeePac';
CaughtByPac : 'CaughtByPac';
ReachedBase : 'ReachedBase';

WS : [ \t\r\n]+ -> skip;

start : s EOF ;

s : U m
  | D m
  | L m
  | R m
  ;

m : U m
  | D m
  | L m
  | R m
  | E m
  | G m
  | P m
  | F m
  | T dead
  | AllDotsEaten w
  | Restart d1
  | GhostStart g_w
  | SeePac g_c
  | CaughtByPac g_e
  | ReachedBase g_r
  ;

w : ; // winning state

dead : ; // trap state

i : G g_f
  | T g_c
  | P m
  ;

g_f : CaughtByPac g_e ;

g_e : ReachedBase g_r
    | Restart g_c
    ;

g_r : SeePac g_c
    | Restart g_c
    ;

g_c : SeePac g_c
    | Restart g_w
    | GhostStart g_w
    ;

g_w : Restart g_c ;

d1 : Restart d2 ;
d2 : Restart d3 ;
d3 : G gameover ;

gameover : U gameover
         | D gameover
         | L gameover
         | R gameover
         ;