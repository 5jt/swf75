"Logistics, British Everest Expedition, 1975"
/ page references are to Everest The Hard Way, Chris Bonington, Hodder & Stoughton, London, 1976

R:([]                                                                          / Reference table
  /camp  Base   1    2   3   4   5   6     equipment weights (lbs) at camps when fully established (pp177-178)
  gear:     0 458   67 228 124 159  32;                                        /   ropes and climbing gear for route to camp
  tent:     0 360 1690 176 506 318  48;                                        /   tentage at camp
  o2:       0  48  384   0 192 144 120;                                        /   oxygen supply
  food:     0 800 2650  28 168  80   8;                                        /   food and fuel
  sleep:   50  20   40   4   8   4   2;                                        /   accommodation with full tentage
  loads:    0  35   35  35  30  30  20;                                        /   Sherpa load capacity to this camp
  loadc:    0  24   24  24  20  20  20;                                        /   climber load capacity to this camp
  climb:    4   4    4   4   4   4   2;                                        /   # lead climbers to reach (p173)
  fail:     0  10   10  10  20  40  40 %100 )                                  /   % of carries that fail (p164)

PEOPLE:`climbers`haps`porters                                                  / HAPs: high-altiude porters
SUPPLIES:`tent`food`gear`o2 
TEAM:PEOPLE!18 26 34                                                           / p172
CAMPS:til 7                                                                    / numbers of all camps
csdtm:{reverse sums reverse select tent,food,gear,o2 from x}                   / cumulative sums down the mountain
CASCADE:csdtm R                                                                / total supplies to be carried to each camp
EATS:5                                                                         / 5lb food & fuel pp daily (p177)
CPS:4                                                                          / climb party size: # to make route
DEBUG:0b
break:{if[DEBUG;'"break"]}
down:{nxt[x]-x}                                                                / move x people & things down
nxt:{0^next x}
prv:{0^prev x}
/ rnd:floor 0.5+
tar:{flip c!floor y*/:x c:cols x}                                                    / y * all rows of table x
up:{prv[x]-x}                                                                  / move x people & things up
/ valt:{value flip x}                                                            / value of a table

/ Initial state
S:flip(TEAM,{x!sum flip R x}`sleep,SUPPLIES),\:6#0

/ work down the mountain, at each camp send up what can be sent, move down those not required
day:{[s]
  new:1+top:last where s[`gear]>=R[`gear];                                     /   top  and next camps
  o:next s[`gear]>R[`gear]%2;                                                  /   flag origin camps for carries
  m:flip{x!(count[x],7)#0}PEOPLE,SUPPLIES;                                     /   movements of people & things
  / LEAD CLIMBING 
  m[top;`gear]+:ceiling R[new;`gear]%3;                                        /   climbing gear (1 day of 3)
  / move up climb party for NEXT camp
  lcgn:ceiling R[new+1;`gear]%3;                                               /   daily climbing gear for NEXT camp
  ncn:R[new+1;`climb];                                                         /   # climbers for NEXT camp
  npn:ceiling(0|lcgn-ncn*R[new+1;`loadc])%R[new+1;`loads];                     /   # porters for NEXT camp
  m[top;`climbers`haps]+:(ncn,npn)*o top;                                      /   party to move to new on 1st day
  if[count q:where o;
    m[q;`climbers]|:s[q;`climbers]&nxt(-). flip s[q;`sleep`climbers] ];                    /   move climbers up where room to sleep

  pa2c:tar[;o]select climbers,haps,porters*CAMPS=0 from s;                     /   people available to carry
  mwt:floor(1-R`fail)*sum pa2c[PEOPLE]*nxt each R`loadc`loads`loads;           /   max load weight 
  break[];
  g2g:tar[;o]select gear,tent,o2,food from 0|(s-m)-R;                          /   good to go
  m+:tar[g2g;]1&0^mwt%sum g2g SUPPLIES;                                        /   same proportion of everything
  s+:up m;                                                                     /   move people and things
  s[`sleep]:floor R[`sleep]*1&s[`tent]%R[`tent];                               /   display only
  s[`food]-:0,1_ EATS*sum s PEOPLE;                                            /   eat dinner (plenty at BC)
  if[any s[`food]<0;'"out of food"];
  s }
/
