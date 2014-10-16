//making all the instances of classes needed in the program and any glabal variables needed

Button Continuee;
Button Hit;
Button Stick;
Button Play;
Button Exitt;
Button HighScores;
Button Sortt;

HighScore Highscores;


DeckClass Deck;
//DeckClass Deck2;
Dealer Dealer;
Human Player;
boolean PlayerAction;
int gamemode=1;
int playerscore=0;
int dealerscore=0;
int highscoresadded;

void setup() {
 
  size(600, 400);
  Deck = new DeckClass();
//  Deck2 = new DeckClass();
  Player = new Human(Deck);
  Dealer = new Dealer(Player);
  Hit = new Button(5, 300, "Hit");
  Stick = new Button(120, 300, "Stick");
  Play = new Button(240, 200, "Play");
  Exitt = new Button(0, 0, "Exit");
  HighScores = new Button(200, 0, "Highscores");
  Continuee = new Button (280, 350, "Continue");
  Sortt = new Button(50, 300, "Sort");
  Highscores = new HighScore();
  Highscores.LoadHighScores();
  boolean PlayerAction = false;
  
}

void draw() {
  background(0, 150, 0);
  playerscore=Player.getScore();
  dealerscore=Dealer.getScore();
 //displays different screens depending on the game mode, the game mode is decided later on in the program, normally due to a 
 //button press.
 
 //quite a few lines here doing very simple things
  if (gamemode==1) {
    
    //shows beginging state, allowing user to input name
    text("Enter your name and hit play!", 215, 150);

    text(Player.Playername, 265, 170);
    Play.drawButton();
  }

  if ((gamemode==2) || (gamemode==3) && (gamemode!=4) && (gamemode!=5)) {//shows the actual game being played if in game mode 1 or 2
    highscoresadded=0;
    Hit.drawButton();
    Stick.drawButton();
    text(Player.Playername, 10, 20);
    text("Dealer", 10, 160);
    //Deck.CreateDeck();
    if (!PlayerAction) {
      Deck.ShuffleDeck();
      Player.DealInitialCards();
      Dealer.DealInitialCards();
    }
    if (Dealer.faceUp) {
      text("Score: "+Dealer.dealervaluehand, 60, 160);
    }
    text("Score: "+Player.valuehand, 80, 20);

    text("hands: "+playerscore, 180, 20);
    text("hands: "+dealerscore, 180, 160);
    Player.updateValueOfHand();
    Dealer.updateValueOfHand();
    Player.showHand();
    Dealer.showHand();
    println(Dealer.dealervaluehand+" Dealer hand ");
  }
  if (gamemode==3) { //shows draw button if the dealer has played
    Continuee.drawButton();
  }
  if (playerscore+dealerscore>=11) {//changes game mode to 4 if the game should end (11 hands played)
  gamemode=4;
  }
  if (gamemode==4) {
    background(0, 150, 0);
    Exitt.drawButton();
    HighScores.drawButton();
    text("<hover over to display high scores",340,20);
    if (playerscore>dealerscore) {

      text(Player.Playername+" Wins! with "+playerscore+" Points", (width/2)-50, (height/2)+50);
      
      if(highscoresadded<1){
      Highscores.AddHighScore(Player.Playername, playerscore);
      highscoresadded++;
      }
      Highscores.SaveHighScores();
      noLoop();
    }
    else {
      text("Dealer wins! with "+dealerscore+" Points", (width/2)-50, (height/2)+50);
      
//      if(highscoresadded<1){
//      Highscores.AddHighScore("Dealer", dealerscore);
//   highscoresadded++;
       }
    
      
      
    




    text ("Game over", (width/2)-50, height/2);
    if ((mouseX>HighScores.btn01_x1) && (mouseX<(HighScores.btn01_x1+HighScores.button_width) && (mouseY>HighScores.btn01_y1) && (mouseY<HighScores.btn01_y1+HighScores.button_height))) {
      background(0, 150, 0);
      gamemode=5;
      println("im being clicked bro");
      noLoop();
    }
  }


  if (gamemode==5) {//shows highscore page if game mode is 5
    background(0, 150, 0);
   


    
    
    
      
    
    text("Highscores", (width/2)-20, 50);
    Highscores.SortHighScores();
    Highscores.ShowHighScores();
    println(gamemode);
    redraw();
  }
}





//  Deck2.CreateDeck();
//  Deck2.ShuffleDeck();
//  Deck.Deck[1].DrawCard(450, 100);
//  Deck2.Deck[1].DrawCard(350, 100);

