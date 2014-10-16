import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class a07 extends PApplet {

Button Continuee;
Button Hit;
Button Stick;
Button Play;
Button Exitt;
Button HighScores;
Button Sortt;

HighScore Highscores;


DeckClass Deck;
DeckClass Deck2;
Dealer Dealer;
Human Player;
boolean PlayerAction;
int gamemode=1;
int playerscore=0;
int dealerscore=0;
int highscoresadded;

public void setup() {
 
  size(600, 400);
  Deck = new DeckClass();
  Deck2 = new DeckClass();
  Player = new Human();
  Dealer = new Dealer();
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

public void draw() {
  background(0, 150, 0);
  playerscore=Player.getScore();
  dealerscore=Dealer.getScore();
 
  if (gamemode==1) {
    text("Enter your name and hit play!", 215, 150);

    text(Player.Playername, 265, 170);
    Play.drawButton();
  }

  if ((gamemode==2) || (gamemode==3) && (gamemode!=4) && (gamemode!=5)) {
    highscoresadded=0;
    Hit.drawButton();
    Stick.drawButton();
    text(Player.Playername, 10, 20);
    text("Dealer", 10, 160);
    Deck.CreateDeck();
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
  if (gamemode==3) {
    Continuee.drawButton();
  }
  if (playerscore+dealerscore>=11) {
    gamemode=4;
  }
  if (gamemode==4) {
    background(0, 150, 0);
    Exitt.drawButton();
    HighScores.drawButton();
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


  if (gamemode==5) {
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

//button class taken from a project done in the HNC (work is my own)

class Button {
  //sets the local variables
  int btn01_x1, btn01_y1, // top left corner
  btn01_w, btn01_h;  // width and height  
  String button_name;
  int clicked=0;
  int button_height = 30;
  int button_width = 100;



  //allows for lots of buttons to be made, by making tempory variables
  Button(int temp_btn01_x1, int temp_btn01_y1, String temp_button_name) {

    btn01_x1 = temp_btn01_x1; 
    btn01_y1 = temp_btn01_y1;  
  
    button_name = temp_button_name;
    
  }

 

    //draws the button to the screen
    public void drawButton() {
      if (clicked==0) {//    |
        fill(255, 0, 0); //    | deals with the color of the the buttons, if the button is clicked it will be changed to a lighter color
      }              //     | if it is not it will stay as the darker grey color
      else {          //     |
        fill(200, 0, 0); //  |
      }
      //creates a rectangle with the data supplied in the setup for the RectButton class
      rect(btn01_x1, btn01_y1, button_width, button_height,20);
      fill(0, 0, 0);
      //creates the text in the button, using the button name from the class aswell as the buttons x/y coords
      text(button_name, btn01_x1+35, btn01_y1+20);
    }
  }

class CardClass {

  int CardWidth=70;
  int CardHeight=90;
  String CardSuite;
  int CardValue;
  String CardName;
  boolean FaceUp=false;
  CardClass() {
  }
  CardClass(int CardNumber, int TempCardSuite) {

    //Takes the temporary card suite values, and decides what suite the card is actually a part off
    //this is done instead of having to write the actual card suite, as users may forget a capital letter
    //or spell the card suite name wrong etc, this is also useful later when building a full deck of cards.
    if (TempCardSuite==1) {
      CardSuite="Diamonds";
    }
    else if (TempCardSuite==2) {
      CardSuite="Spades";
    }
    else if (TempCardSuite==3) {
      CardSuite="Clubs";
    }
    else {
      CardSuite="Hearts";
    }


    //here it determines the name of the card using the card number
    //again this is easier than actually entering the name of the card while
    //creating it, incase of spelling mistakes etc, and again it is easier later
    //when using loops to create a deck of cards.
    if (CardNumber == 11) {
      CardName="Jack";
      CardValue=10;
    }
    else if (CardNumber == 12) {
      CardName="Queen";
      CardValue=10;
    }
    else if (CardNumber == 1) {
      CardName="Ace";
      CardValue=1;
    }
    else if (CardNumber == 13) {
      CardName="King";
      CardValue=10;
    }
    else {
      CardName=""+CardNumber;
      CardValue=CardNumber;
    }
    
  }

  public void DrawCard(int CardX, int CardY,boolean tempfaceup) {
    FaceUp=tempfaceup;

    //draws a rectangle and text on it (related to card) using the CardX and CardY
    //intergers above, notice CardY-20, cardY+15 etc, these are simply used to get the card
    //and its text in as nice a looking place as possible.
    //if FaceUp is not true it simply displays a black rectangle to show that the card
    //is face down.

    if (FaceUp) {
      fill(230, 0, 0);
      rect(CardX-10, CardY-20, CardWidth, CardHeight);
      fill(0, 0, 0);
      text(CardName+" of", CardX, CardY); 
      text(CardSuite, CardX, CardY+15);
      text(CardValue, CardX, CardY+45);
    }
    else {
      fill(0, 0, 0);
      rect(CardX-10, CardY-20, CardWidth, CardHeight);
    }
  }
}

class Dealer extends Human implements Player {

  boolean dealerstick = false;
  int dealer_cards_dealt;
  int dealerhandvalue;
  String dealervaluehand="";
  boolean faceUp = false;

  Dealer() {
    super();
  } 




  public void DealerAI() {
    int loopcounter=0;
    DealInitialCards();
    int ii = 0;
    boolean dealeractive = true;

    println(dealerhandvalue+"im a hand value");
    println(loopcounter+" im a loop counter");
    updateValueOfHand();
    if (dealerhandvalue >=17) {
      dealeractive=false;
    }

    if (dealeractive) {
      for (ii=ii; ii < 4; ii++) {
        updateValueOfHand();
        if ((dealerhandvalue<17) && (dealer_cards_dealt <6)) {
          twist();
          updateValueOfHand();
          println("Dealer took card");
          println(ii+"and looped this much");
        }
        else {
          println("cant take card");
        }
      }

      if (dealerhandvalue==16) {
        twist();
        updateValueOfHand();
      }
      if (dealerhandvalue==17) {

        for (int j = 0; j<cards_dealt;j++) {
          //Here is where the dealer deals with a 'soft 17' if the value of the hand is 17
          //then it loops through the dealers cards, if it finds an ace, then it loops through the dealers cards
          //again, if it then finds a 6, then the dealer has a soft 17 and he takes another hitm other wise
          //the dealer simply sticks
          if (Deck.Deck[j+6].CardName=="Ace") {
            for (int k = 0; k<cards_dealt;k++) {
              if (Deck.Deck[k+6].CardValue==6) {
                twist();
                updateValueOfHand();
              }
            }
          }
        }
        dealerstick=true;
        faceUp=true;
      } 
      updateValueOfHand();
      showHand();
      println(loopcounter+"hi im loop counter");
    }
  }

  //function to deal the initial cards, does surprisingly little.
  //just changes a variable (dealer_cards_dealt) this is used later on 
  //in twist etc, when displaying the cards, or getting scores, it simply loops through the 
  //deck until it gets to dealer_cards_dealt
  public void DealInitialCards() {
    dealer_cards_dealt=2;
    updateValueOfHand();
  }

  //simply adds one to the number of cards dealt, if the player is not bust, and if the player has not stuck
  public void twist(/* you can add an argument here */) {



    if (!dealerstick) {
      dealer_cards_dealt++;
      updateValueOfHand();
    }
  }

  public void updateValueOfHand(/* you can add an argument here */) {
    dealerhandvalue=0;

    //loops through the deck of cards from the first position to the amount of cards that have been dealt
    //adds the value of the current card in the deck to the value of the players hand
    for (int i = 0; i<dealer_cards_dealt;i++) {

      dealerhandvalue+=Deck.Deck[i+6].CardValue;
      dealervaluehand=""+dealerhandvalue;
    }
    //here is where the ace is dealt with, if the value of the hand is <12 then the ace' value is set to 11
    //(as the ace value is already 1 this is done by simply adding ten to the current calue of the hand


    if (dealerhandvalue==17) {

      for (int i = 0; i<cards_dealt;i++) {
        //Here is where the dealer deals with a 'soft 17' if the value of the hand is 17
        //then it loops through the dealers cards, if it finds an ace, then it loops through the dealers cards
        //again, if it then finds a 6, then the dealer has a soft 17 and he takes another hitm other wise
        //the dealer simply sticks
        if (Deck.Deck[i+6].CardName=="Ace") {
          for (int j = 0; j<cards_dealt;i++) {
            if (Deck.Deck[j+6].CardName=="6") {

              twist();
            }
          }
        }
      }
    }
    if (dealerhandvalue<=11) {
      for (int i = 0; i<dealer_cards_dealt;i++) {
        //here is where it actually looks for an ace
        if (Deck.Deck[i+6].CardName=="Ace") {
          dealerhandvalue=dealerhandvalue+10;
          dealervaluehand=""+dealerhandvalue;

          println("i found an ace"+dealerhandvalue);
        }
      }
    }
    //if the claue of the hand is more than 21 then the user is bust (in later versions of the game 
    //this will also mean that the player loses the game
    if (dealerhandvalue>21) {
      dealervaluehand="BUST";
    }
    if (dealerhandvalue==21) {
      dealervaluehand="21";
    }


    println(dealervaluehand);
  }

  public void stick() {
    dealerstick=true;
  }  


  public void updateScore(int valuetoadd) {
    score+=valuetoadd;
  } 

  public int getValueOfHand() {

    return dealerhandvalue;
  }



  public int getScore() {

    return score;
  }

  // Show hand essentially uses the same code as the player does, as the player will only ever have 6 cards, 
  // we only display cards that are >6 for the dealer (cards dealt will be initialised as 6 for the dealer

  //here is where it displayus the hand
  public void showHand() {
    //no loop is here so that it doesnt happen frameRate*persecond
    noLoop();
    //loops through the array in the same fashion as the function that gets the value of the hand
    for (int i = 0; i<dealer_cards_dealt;i++) {
      //instead of taking the value of the current position in the array it displays that card to the screen
      //if(i>6){
      Deck.Deck[i+6].DrawCard(i+(100*i)+20, 190, faceUp);

      //println(Deck.Deck[i].CardValue);
      // }
    }
    //println(dealer_cards_dealt);
  }    
  //sets value of hand and cards dealt to 0 and als re-shuffles the deck. (might later need to add anotehr varieble in here to 
  //start a new game or something.
  public void clearHand() {
    DealInitialCards();
    faceUp=false;
    dealerhandvalue=0;
    Deck.ShuffleDeck();
  }
}


class DeckClass extends CardClass {

  CardClass[] Deck = new CardClass[0];

  DeckClass() { 
    super();
  }



  public void CreateDeck() {
    if (Deck.length < 52) {  
      for (int i=0; i<4; i++) { //4 suits                         
        for (int j=0; j<13; j++) { //13 cards per suit           
          CardClass temp = new CardClass(j+1, i+1);
          Deck = (CardClass[]) append(Deck, temp);
          println((j+1)+"+"+(i+1)+" Added");
        }
      }
      println(Deck);
     
    }
  }

  public void swap(int indexA_, int indexB_) {
    //this is the swap method to be used with the ShuffleDeck method, it simply takes in two ints
    //that relate to a place in the deck array it then uses these ints to swap the data in one element of the array
    //to another.

    CardClass holdindexA         = Deck[indexA_];
    Deck[indexA_] = Deck[indexB_];
    Deck[indexB_] = holdindexA;
  }

  public void ShuffleDeck() {
//here the deck is shuffled, its a rather simple method, all it does is go through the array 100*
//and genereate 2 random ints between 0-51 it then uses the swap function on them. notice noLoop();
//this is so that when called in the draw loop it does not just carry on going on and on.


    for (int i=0; i<456; i++) { 

      int y = (int)random(0, Deck.length);  
      int x = (int)random(0, Deck.length);    
      swap(y, x);
    }
    noLoop();
  }
}






class Human implements Player {

  //class variebles needed for methods etc
  boolean playerstick = false;
  int cards_dealt;
  int handvalue;
  String valuehand="";
  String Playername="Player";
  int score=0;
  Human() {
    
  }


  //function to deal the initial cards, does surprisingly little.
  //just changes a variable (cards_Dealt) this is used later on 
  //in twist etc, when displaying the cards, or getting scores, it simply loops through the 
  //deck until it gets to cards_dealt
  public void DealInitialCards() {
    cards_dealt=2;
    handvalue=0;
    valuehand="";
    updateValueOfHand();
  }

  //simply adds one to the number of cards dealt, if the player is not bust, and if the player has not stuck
  public void twist(/* you can add an argument here */) {
    if (cards_dealt<6) {
      if (valuehand!="21") {
        if (valuehand!="BUST") {
          if (!playerstick) {
            cards_dealt++;
          }
        }
      }
    }
  }

  public void updateValueOfHand(/* you can add an argument here */) {
    handvalue=0;

    //loops through the deck of cards from the first position to the amount of cards that have been dealt
    //adds the value of the current card in the deck to the value of the players hand
    for (int i = 0; i<cards_dealt;i++) {

      handvalue+=Deck.Deck[i].CardValue;
      valuehand=""+handvalue;
    }
    //here is where the ace is dealt with, if the value of the hand is <12 then the ace' value is set to 11
    //(as the ace value is already 1 this is done by simply adding ten to the current calue of the hand
    if (handvalue<=11) {
      for (int i = 0; i<cards_dealt;i++) {
        //here is where it actually looks for an ace
        if (Deck.Deck[i].CardName=="Ace") {
          handvalue=handvalue+10;
          valuehand=""+handvalue;
          println("i found an ace"+handvalue);
        }
      }
    }
    //if the claue of the hand is more than 21 then the user is bust (in later versions of the game 
    //this will also mean that the player loses the game
    if (handvalue>21) {
      valuehand="BUST";
    }
    if (handvalue==21) {
      valuehand="21";
    }


    println(valuehand);
  }

  public void stick() {
    playerstick=true;
  }  


  public void updateScore(int valuetoadd) {
    score+=valuetoadd;
//    if(handvalue==21){
//      score++;
//    }
//    else if(Dealer.getValueOfHand()>21){
//      score++;
//    }
//    else if((handvalue<22)&&(handvalue>getValueOfHand())){
//      score++;
//    
  } 
  

  public int getValueOfHand() {

    return handvalue;
  }



  public int getScore() {

    return score;
  }



  //here is where it displayus the hand
  public void showHand() {
    //no loop is here so that it doesnt happen frameRate*persecond
    noLoop();
    //loops through the array in the same fashion as the function that gets the value of the hand
    for (int i = 0; i<cards_dealt;i++) {
      //instead of taking the value of the current position in the array it displays that card to the screen
      Deck.Deck[i].DrawCard(i+(100*i)+20, 50,true);

     // println(Deck.Deck[i].CardValue);
    }
   // println(cards_dealt);
  }    
  //sets value of hand and cards dealt to 0 and als re-shuffles the deck. (might later need to add anotehr varieble in here to 
  //start a new game or something.
  public void clearHand() {
    playerstick=false;
    DealInitialCards();
    
    handvalue=0;
    Deck.ShuffleDeck();
  }
}

class HighScore {

  //most of this code will be taken from an old project (the same one as before) note that all code was done by me.

  ArrayList<String> names;
  ArrayList<Integer> scores;

  HighScore() {
    names = new ArrayList();
    scores = new ArrayList();
  } 

  public void swapName(int indexA_, int indexB_) {
    String holdindexA         = names.get(indexA_);
    names.set(indexA_, names.get(indexB_));
    names.set(indexB_, holdindexA);
  }
  public void swapScore(int indexA_, int indexB_) {
    int holdindexA         = scores.get(indexA_);
    scores.set(indexA_, scores.get(indexB_));
    scores.set(indexB_, holdindexA);
  }
  int startIndex = 0;

  public void SortHighScores() {
  println("yes i work");






    //for (long j = 0; j<20000000;j++) {
      for (int i = 0; i < scores.size() - 1; i++) { //i is current pos in array
        if (scores.get(i) < scores.get(i+1)) { //compares current pos and next pos in array
          swapName(i, i+1);
          swapScore(i, i+1);        //if its bigger the items  are swapped
          println("sorted");
        }
        println("i work too");
      }
      loop();
    }
 // }







  public void ShowHighScores() {
    for (int i = 0; i<scores.size(); i++) {
      if(i<10){
      text(names.get(i)+"       "+scores.get(i), 150, 100+(20*i));
      }
    }
  }



  public void AddHighScore(String Name, int Score) {
    names.add(Name);
    scores.add(Score);
  }

  public void SaveHighScores() {
    PrintWriter namess;
    PrintWriter scoress;
    namess = createWriter("names.txt");
    scoress = createWriter("scores.txt");

    for (int i = names.size()-1; i >= 0; i--) { //finds the size of the array
      String currentname = names.get(i); //gets the current position in the array so its variables can be acceseed
      namess.println(currentname); //prints data to linkfile.txt (\t makes a tab)
    }
    namess.flush(); // Write the remaining data
    namess.close(); // Finish the file

      for (int i = scores.size()-1; i >= 0; i--) { //finds the size of the array
      int currentscore = scores.get(i); //gets the current position in the array so its variables can be acceseed
      scoress.println(currentscore); //prints data to linkfile.txt (\t makes a tab)
    }
    scoress.flush(); // Write the remaining data
    scoress.close(); // Finish the file
  }

  public void LoadHighScores() {

    BufferedReader namereader; //creates the reader
    BufferedReader scorereader;
    String line;

    namereader = createReader("names.txt"); //sets readers to read from the file that nodes and links are saved in
    line = "asdf"; //line is used to go throught the file and take data, the data it is intialised with is not important
    scorereader = createReader("scores.txt");                                   

    names.clear();    //clears the node/link lists so that the new data does not get mixed up with the data that is currentley inside it                                                          
    scores.clear();                                                            

    while (line != null) { //while there is data to be read from the file

      try {
        line = namereader.readLine(); //reads through the file line by like
      } 
      catch (IOException e) {
        e.printStackTrace();    //if there is nothing to be read, line is set to null 
        line = null;
      }
      if (line == null) {
        // Stop reading because of an error or file is empty
        println("End of file"); //displays to the user that there is not anything else to be read in the file
      } 
      else {
        String tempname = line; //splits the lines into pieces using there tabulation


        //


        names.add(tempname); //creates names with the data found in the file
      }
    }
    line = "alskdjsalkh"; //resets the line, so that the next while loop will loop


    while (line != null) { //while there is data to be read from the file

      try {
        line = scorereader.readLine(); //reads through the file line by like
      } 
      catch (IOException e) {
        e.printStackTrace();    //if there is nothing to be read, line is set to null 
        line = null;
      }
      if (line == null) {
        // Stop reading because of an error or file is empty
        println("End of file"); //displays to the user that there is not anything else to be read in the file
      } 
      else {
        int tempscore = PApplet.parseInt(line); //splits the lines into pieces using there tabulation


        //


        scores.add(tempscore); //creates names with the data found in the file
      }
    }
  }
}

/*

_01
Created the CardClass and the DrawCard method within the class, in the constructer it takes 2 values
one being the number of the card (1-13) the other being the suite (1-4) within the constructer itself
it sets the name of the card, using the card number (for 2-10) if the card number is more than 10, 
it sets its according name (jack,queen,king,ace), it also sets the value of the card (again using the
card number for 2-10) if the card number is more than 10, the card value is set to 10 anyway, if the card
value is 1, its value is set too 11. (Later on in the developement there will need to be code to decide 
whether an ace is worth 1 or 11) however it is not needed yet and may not be handled in the class.

I have tested that all of the if statements are working, simply by creating a card using each of the 
suites, and testing that the card numbers above 10 are showing the correct name. For the sake of 
testing, i have also displayed the value of the cards on the card itself. I am not sure if i will keep 
this in the program.

The drawcard function takes in 2 numbers (cardx and cardy) it then draws a rectangle of a set size
and this position, it then uses the position to draw the card name and suite.

There are 4 cards created in this implement of the program, showing that all 4 suites, the queen, ace etc
are in full working order. And shows the cards both displaying face up and dowm.



_02
In version _02 i am going to create the deck class, the deck class has to create a full deck of cards
(52 cards) these will be put into an array of card objects. It also needs to contain a method that will
shuffle the deck of cards: Note that in the planning document, card is an inner class of deck, so i 
will also be making card an inner class of deck (i made the card class first simply as is was an 
easier way to do it (in my head))
How i will test everything is working correctly:
  - Will first of all check that the array is full after creating it
  - Will then need to make sure that all the elements in the deck array are unique
    will do this by simply going throught the array, and printing its content to the console
    and making sure all of the content is different.
      -Will need to use the same sort of testing technique when testing that the shuffle function is
       working correctly, will need to make sure that the shuffling is always different, and that it is
       actually shuffling the cards.
       
Had a little trouble making sure that the deck was created the right size (as i was using append it just kept
making the array bigger and bigger) and for some reason, when i said to only add an element if the arrays length
was less that 52 it still went to over 100, so i changed this statement to half of this(26) and it is now adding the 
correct elements (using to printtln functions i can see what is being added to the array of objects is unique and 
that is is making a full deck)

I actually chose to make Deck just extend the card class for the time being.
I succeeded in checking that the array was full useing the println functions, and then continued to see if all the elements were different
sinply by displaying each card.

Having trouble with the shuffle deck function, managing to get the cards to move around the deck is easy enough, 
Just strugglind to set the amount of times it moves and making sure its always different.
**MAnaged to get it to not continually loop round by using noLoop(); in the shuffle deck function,
i presume it just did that because the draw() method continually loops.

Tested to see if the data in the arrays were being shuffled and all seems to be working correctly.


_03
Took the Player interface and added it to the program.
Created the player class

Went with the class name human instead of player as the interface is called player. 

noLoop(); and redraw(); funtions causing bother while dealing extra cards to the deck
as we need it not to loop in order to stop the cards constantly shuffeling
but we need to redraw so we can see new cards when they are pulled

Solved this by accing a varieble called player action, in the main program, and basicly
said if the player has not made an action deal initial cards, if not is doesnt. there will most likely be 
something like this implemented in the dealer class as the dealer class is most likely going to implement player and control almost
all of the game.

I had initially planned on using an arrayList() to store the cardsthat the player has, i instead went with the option of
simply storing a varieble that says how many cards they have been dealt, then to draw the cards it simply draws from the first element of the array
to the amount of cards that they have been dealt (uses the same type thing when getting the value of the hand).

Some extra variebles were added here, that were not in the UML diagrams i had made like the value hand string, i also changed the name
of the boolean originally in my UML diagram as the new name is easier to type when coding. There are alo some varieble that are in the 
UML diagrams but are not infact used 

Testing the ace: To test that the ace was being counted as 11 at the right point it was simple, as the first element in the deck array
is infact an ace, to check that it was being counted as a 1 at the proper time it was slightly harder, but after running the program ~30
times it was apparent it was working properly.

Testing that cards were not being dealt if the player was bust or if the player had 21 was simply a case of running the program and playing 
through it.

**NOTE
That just because the variables have not been used in thsi version does not mean that they are nto going to be used in a later version.

Big problam that occurred:
When trying to make human extend the deck class, there was an issue with many of the methods i wanted to call etc, and so i have chose to 
deal with that in a later version. (Big break of encapsulation)


_04
What i intend to do in this version of the program;
    -Implement the button class
    -Possibly create a front page/game page, front page having a button saying play and asking the user to input there name.
    -Implement the Dealer class. (will most likely not implement the dealer AI/'game' method yet. *
    
    **MAYBE**
Deal with the human class extending the deck class, to fix one major encapsulation issue so far in the program.

All functions in the dealer class (That are in the player interface) are working, the dealer AI has not been made yet, but will
be in the next versiom.

Put the mouseClicked function on its own page, as it is going to be used to handle pressing of buttons and so will get 
rather large

Created the dealers AI and tested everything by playing the game. Could be checked easier by fixing the cards that the dealer is deal

Used code that i used in a previous project (some of which was found on previous tutors website) to allow the user to input there name, it then
sets a class variable to that. By default it is just "Player"

there is now a variable called gamemode, which is changed for different pages, for example if gammode is 1 then it asks the user for there name
and after they press play the game mode is set too two and there name is used instead of player, after the player sticks it goes into gamemode 3 
and another button appears allowing them to continue onto the next hand.


  *Note that the Dealer class is very like the player class, and so like the player class there are going to be alot of changes in 
  the variebles in the class compared to the UML diagrams created later, i will most likely make a document to explaing the changes, but will
  at the very least create updated UML diagrams. Alot of the code for methods will be very like the code for the ones in the human class,
  the only differences will be in the cards that are dealt to the dealer and the extra 'AI' method, that may be used to control the game
  (if not, it will just be used to deal with the dealer beign issued cards etc and the Draw() loop/method will deal with the actual game itself.
  
  
_05

**CHANGE MADE TO INTERFACE**
In the interface handed out by the teacher in class there was no option to add an arguement for updatescore();
i decided to add an arguement for this method anywaym, as i have chosen to do the scoring system outside of the 
player/dealer classes, all of the other methods make this very easy (the getters for the value of the dealers and
players hand).
This paired with a setter method for the score, seems like the easiest way to implement the scoring system while keeping
ecapsulation as tight as possible.

Dealt with the continue button when you are in game mode 3 so that when it is pressed it shuffles the deck and then resets the game

Will be implementing the code that allows the dealer to compare hands, and then keep scores.

Implemented the score sstem , that determines the winner of a round according to the value of each players hand



***NOTED BUGS***
OCCASIONALYY when you have 2 aces, it will cont you as bust instead of counting one of them as 1.
Occasionally the dealer will not take a card when deck is less thatn 17
Sometimes the players score wont update on screen (value of hand is still correct)
Sometimes after pressing the stick button (normally on the 5th -7th game) the program would crash,
thanks to a prinln for debugging we see that this is in the loop that chooses when the dealer is to take cars


--- Note that the issue with the loop crashing the program was fixed with a simple counter, saying that the loop could 
only go round 10 times, this seems to have had no effect on the player taking cards and he still seems to be taking them as 
he should be.
--- Note that the issue with the dealer not taking cards when he should seems to be sorted when 
running the program as an exported windows application, this makes me wonder if it is an issue with the code itself 
or processing.
--- Note that the issue with aces also seems to be resolved when running the program after exporting.




Testing the scoring system was simple, through playing through the game and using fixed results and just playing through the game
it was apparent it was in full working order, from now on all tests i do will be done in an exported application, 
as it tends to work better every time.

Out of the 10-20 times i ran the program, it worked perfectly 18-19 of the times, for some reason sometimes it still does nto work properly,
will be doing more work on the part of code that deals with aces in more detail, to ensure that when the dealer is dealt one, it is dealt with before he 
chooses whether or not to deal himself another card (dealer ai seems to be working perfectly, apart from sometimes, for example he will get an 
ace and an 8 and his score will be reduced to 9 appropriately, but the next card will nto actually be taken.


I know that alot of the testing up to this point has been rather unorganised, i thought that a more formal show of results was 
required and so i made a video of a full game (in this version). It will be contained within a folder in _05 and 
will be accompanied by a text file, highlighting areas it shows in working order.



*****ENCAPSULATION BREAK*****
At this point alot of the program has been done, without the player class actually implementing the deck class,
this shows a huge break in encasulation as the player class relies on an actual pre-made deck to work.



_06
The main thing i intend to do is get the highscore system working
This will be done by making a high score class, which will have 3 functions, 1 too add a high score, one to check its place,
and one to display it. Instead of choosing its place in the list with a method, i may make one that instead just sorts the list(s).


--- Now a little bit into making the actual high scores class, and realise i may need methods to export/import the files.

For the saving and loading of the files i used alot of code i used in the finomili project and it was mainly a case of changing some variable names
and types

First shot at saving high score - would save the name but not the high score!
(fixed, was trying to add scores to name file)

Testing that score are being added will most likely be done with screen capping software and making another video,
may just use screenshots if screencapping software is hard to find. Testing that high scores are being stored in the right order will 
be made easier with the ability too add scores and names straight to the files.

For the sake of testing, in this version(maybe others too) the dealers scores can be entered into the highscores list
(because for some reason i lose this game too much)

Used the fact i could manually put data in the files to my advantage when testing that the highscores display system was working, and this showed me
that it was. (Note that they are not yet been showed in the correct order, i will use bubble sord code, to first sort the data in the arraylists containing the 
high scores and names.

High score sorting system was slightly hard to put in place, due to all the redraw's loop()'s etc in the program, but got there in the end.
tested that it was sorting scores by adding random socres to the score file, and naming players in teh score file i was position (1-10)
and then checking that the scores were all in order.

I made it so that the high score page only showed for a set amount of time, it then takes you back to the game over page, so that the user
is given the option to exit again.



_07
In this version i hope to clean up as many of the bugs involving the dealer as i can (so far these are the only bugs i have
found in the program)

Looked through the code for the dealer, it seemed like the value of his hand was not being updated after the ace was dealt with, so 
i added some code to do that, and the issue where the dealer was counting an ace as a 1, when he could use it as 11 (and was not taking any
more cards) has now been fixed.

It also came to my attention that the dealer was infact not looking at his own cards at certain points in the code (was adressing point i instead
of i+6)

For some reason this change created another issue (SOMETIMES when running the program an error would come up saying
that the sketch was trying too much recusion)
-----Sorted this issue (was calling updatevalueofhand when i did not need too (i was manually updating it at that point anyway(adding 10 for ace))

**Just a small note, fixing the issue with the dealer accessing the wrong card, seems to have dealt with the fact that program would sometimes be slightly unresponsive.

The dealer will still sometimes not take another card when the value of his deck is <17, but the amount of times it happens has dramaticly lowered
(around 1 in ten games now)
**UPDATE
  i have now taken the control of this out of the while loop, and put it into a for loop. Problam seems to be taken care of.
  
Dealers ai seems to be working fine now.


Screenshots (gyazo links);
^
May take screen shots for specific thingsm but for the most part changes and features will be highlighted in a shor video for the version.


*/



interface Player {  
  
  // This is the interface you are expected to implement for both
  // the computer controlled 'dealer' and the human player(s)
  
  // You can change the return types for any of the items in the interface.
  // You can also add arguments two the first two method listed below
  
  public void twist(/* you can add an argument here */);               // This method should allow the player to add acard to their hand
  
  public void updateValueOfHand(/* you can add an argument here */);   // Updates the the value of the cards the player has in their hand
    
  public void stick();        // Called when the player does not want to take another card
  
  public void updateScore(int valuetoadd);  // Updates the player's overall score (number of games they have won)
  
  public int getValueOfHand(); // Getter method for the value of the cards the player has in their hand
  
  public int getScore();      // Getter method for the player's overall score (number of games they have won)
  
  public void showHand();     // Used to display the player's hand on screen
  
  public void clearHand();    // Used at the end of a round to empty the cards in the player's hand

}

//code taken from a project done in HNC year (Work is still my own)
String txt_str="";
  
public void keyPressed() {


  int BACKSPACE = 8;
 
  
//code for backspace is taken from vnon.net
      char keyed = key;
      if (keyed == BACKSPACE) { //if back space is hit
        int str_len = txt_str.length();
        if (str_len > 0) {
      txt_str = txt_str.substring(0, str_len - 1); //substring reduces the size of the string by one
        }
      } 
      else if((txt_str.length() < 10) && (key != CODED)) { // ensures only 9 chars can be inputed and coded characters could nto be inputed
        txt_str += str(keyed);

      }
      Player.Playername = txt_str; //sets node name to txt_str
    }


public void mouseClicked() {

  if ((mouseX>Play.btn01_x1) && (mouseX<(Play.btn01_x1+Play.button_width) && (mouseY>Play.btn01_y1) && (mouseY<Play.btn01_y1+Play.button_height))) {

 
    gamemode=2;
   
  
  }
   if ((mouseX>HighScores.btn01_x1) && (mouseX<(HighScores.btn01_x1+HighScores.button_width) && (mouseY>HighScores.btn01_y1) && (mouseY<HighScores.btn01_y1+HighScores.button_height))) {
     background(0,150,0);
     gamemode=5;
     println("im being clicked bro");
     redraw();
     
  }

  if (gamemode==2) {
    if ((mouseX>Hit.btn01_x1) && (mouseX<(Hit.btn01_x1+Hit.button_width) && (mouseY>Hit.btn01_y1) && (mouseY<Hit.btn01_y1+Hit.button_height))) {  //if hit is pressed


      Player.twist();

      Player.showHand();

      Player.updateValueOfHand();

      loop();

      println(Player.cards_dealt);
      PlayerAction = true;
    }
    if ((mouseX>Stick.btn01_x1) && (mouseX<(Stick.btn01_x1+Stick.button_width) && (mouseY>Stick.btn01_y1) && (mouseY<Stick.btn01_y1+Stick.button_height))) {
      Dealer.faceUp=true;
      Player.updateValueOfHand();
      Dealer.DealerAI();
      Dealer.showHand();
      Player.playerstick=true;
      PlayerAction = true;
      gamemode=3;
      redraw();
    }
  }
  if ((mouseX>Continuee.btn01_x1) && (mouseX<(Continuee.btn01_x1+Continuee.button_width) && (mouseY>Continuee.btn01_y1) && (mouseY<Continuee.btn01_y1+Continuee.button_height))) {
    scoreSystem(Player.getValueOfHand(),Dealer.getValueOfHand());
    gamemode=2;
    Dealer.clearHand();
    Player.clearHand();
    Player.updateValueOfHand();
    redraw();
    
  }
  if ((mouseX>Exitt.btn01_x1) && (mouseX<(Exitt.btn01_x1+Exitt.button_width) && (mouseY>Exitt.btn01_y1) && (mouseY<Exitt.btn01_y1+Exitt.button_height))) {
    exit();
  }
 
  
  
 
  
  
}

//intended to be used for player/dealer. Score1 being pl;ayer.

public void scoreSystem(int playerscore,int dealerscore){
  int pointworth=1;
  
  if (playerscore==21){
    Player.updateScore(pointworth);
  }
  else if(dealerscore==21){
    Dealer.updateScore(pointworth);
  }
  else if(playerscore>21){
    Dealer.updateScore(pointworth);
  }
  else if(dealerscore>21){
    Player.updateScore(pointworth);
  }
  else if(playerscore>dealerscore){
    Player.updateScore(pointworth);
  }
  else{
    Dealer.updateScore(pointworth);
  }
  
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "a07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
