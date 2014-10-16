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
  void DealInitialCards() {
    cards_dealt=2;
    handvalue=0;
    valuehand="";
    updateValueOfHand();
  }

  //simply adds one to the number of cards dealt, if the player is not bust, and if the player has not stuck
  void twist(/* you can add an argument here */) {
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

  void updateValueOfHand(/* you can add an argument here */) {
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

  void stick() {
    playerstick=true;
  }  


  void updateScore(int valuetoadd) {
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
  

  int getValueOfHand() {

    return handvalue;
  }



  int getScore() {

    return score;
  }



  //here is where it displayus the hand
  void showHand() {
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
  void clearHand() {
    playerstick=false;
    DealInitialCards();
    
    handvalue=0;
    Deck.ShuffleDeck();
  }
}

