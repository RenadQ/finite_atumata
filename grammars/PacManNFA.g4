grammar PacManNFA;


U : 'U';
D : 'D';
L : 'L';
R : 'R';
E : 'E';
F : 'F';
P : 'P';
T : 'T';
G : 'G';
G_E : 'G_E';
G_R : 'G_R';
G_W : 'G_W';
G_C : 'G_C';
G_F : 'G_F';
SeePac : 'SeePac';
AllDotsEaten : 'AllDotsEaten';
Restart : 'Restart';
I : 'I';
D1 : 'D1';
D2 : 'D2';
D3 : 'D3';
W : 'W';
GameOver : 'GameOver';

WS : [ \t\r\n]+ -> skip;


// Entry Rule

start : game+ EOF ;


// Game logic (each game unit)

game
    : m
    | invincible
    | death1
    | death2
    | death3 gameOver
    | ghostBehavior
    | win
    ;


// Pac-Man Movement Logic

m : movement m?
  | E m?
  | F m?
  | G m?             
  | P invincible
  ;

movement : U | D | L | R ;


// Invincibility Mode
invincible : I powerInteraction ;

powerInteraction
    : G_E G_R
    | T
    ;


// Death Transitions
death1 : D1 Restart ;
death2 : D2 Restart ;
death3 : D3 ;

gameOver : GameOver ;


// Winning Condition

win : AllDotsEaten W ;


// Ghost Behavior Logic

ghostBehavior : G_W ghostChase ;

ghostChase : SeePac G_C
           | P ghostFlee ;

ghostFlee : G_F G_E G_R G_W ;