//Madelyn Chong
// June1
//Bullet hell
/* QS:
1. want to shoot the shield 4 times until it dies 
2. when shield lives = 0 ,how can I make the bubble appear around the spaceship??????
3. Different Enemy Bullets
4. Differen Enemy MOvements
5. SUper power for Spaceship
6. Creat super Enemy.
*/

//Imports
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage[] gif;
int numberOfFrames;
int f;
PImage spaceship1;
PImage spaceship2;
PImage spaceship3;
PImage enemy1;
PImage enemyB;
PImage enemyC;
PImage enemyD;
PImage enemyE;
PImage superEnemy;
PImage aid;
PImage optionsbackground;
PImage shield;
PImage bubble;
PFont font; 

color pink = #EFD9CE;
color p1   = #DEC0F1;
color p2   = #B79CED;
color p3   = #957FEF;
color p4   = #7161EF;
color yellow1 = #FFC300;
color yellow2 = #FFD60A;
color dblue = #1d3557;
color lblue = #f1faee;
color o1  = #f9844a;

//bullet colour
color blue = #72efdd;
color green = #081c15;

//Global variables
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;
final int OPTIONS= 4;
final int SPACESHIP1 = 5;
final int SPACESHIP2 = 6;
final int SPACESHIP3 = 7;
boolean directions;
boolean shooting;
boolean protection;
int ship = SPACESHIP1;
int score, lives, timer;
int i;


// ARRAYLIST
ArrayList<GameObject> objects;
Starfighter player1;

//keyboard variables 
boolean rightkey, leftkey, upkey, downkey, space;
int n =  100;

void setup() {
  size(800, 800);
  mode = INTRO;
  rectMode(CENTER);

  numberOfFrames = 12;
  gif = new PImage[numberOfFrames];

  int i = 0;
  while (i< numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i=i+1;
  }

  objects = new ArrayList<GameObject>();
  player1 = new Starfighter();
  objects.add(player1);

  //LOAD images 
  spaceship1 = loadImage("spaceship1.png");
  spaceship2 = loadImage("spaceship2.png");
  spaceship3 = loadImage("spaceship3.png");
  enemy1 = loadImage("enemy.png");
  enemyB = loadImage("23530209.png");
  enemyC = loadImage("enemyM.png");
  enemyD = loadImage("enemyN).png");
  enemyE = loadImage("enemyC.png");
  superEnemy = loadImage("enemyD.png");
  shield = loadImage("shield.png");
  aid = loadImage("aid.png");
  bubble = loadImage("bubble.png");

  //font
  font = loadFont( "Algerian-48.vlw");
  textFont(font);
  // initialized score+lives
  score = 0;
  lives = 3;
  timer=60;
}

void draw() {//a looped funtion
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==OPTIONS) {
    options();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
