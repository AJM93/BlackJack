class Dealer extends Human implements Player {

  boolean dealerstick = false;
  int dealer_cards_dealt;
  int dealerhandvalue;
  String dealervaluehand="";
  boolean faceUp = false;
  Human Playerr;
  


  Dealer(Human Player) {
    super();
    Playerr=Player;
      println(Playerr.Deckk.Deck[1].CardName);
  } 




  void DealerAI() {
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
    println(dealeractive);

  if((dealerhandvalue==15) || (dealerhandvalue==16)){
    twist();
    updateValueOfHand();
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
          if (Playerr.Deckk.Deck[j+6].CardName=="Ace") {
            for (int k = 0; k<cards_dealt;k++) {
              if (Playerr.Deckk.Deck[k+6].CardName=="6") {
               twist();
                updateValueOfHand();
              }
           }
          }
        }

//        faceUp=true;
      } 
      updateValueOfHand();
      showHand();
      println(loopcounter+"hi im loop counter");
    }
  }

  //function to deal the initial cards, does surprisingly little.
  //just changes a variable (dealer_cards_dealt) this is used later on 
  //in twist etc, when displaying the cards, or getting scores, it simply loops through the 
  //Player.Deck.Deck until it gets to dealer_cards_dealt
  void DealInitialCards() {
    dealer_cards_dealt=2;
    updateValueOfHand();
  }

  //simply adds one to the number of cards dealt, if the player is not bust, and if the player has not stuck
  void twist(/* you can add an argument here */) {



    if (!dealerstick) {
      dealer_cards_dealt++;
      updateValueOfHand();
    }
  }

  void updateValueOfHand(/* you can add an argument here */) {
    dealerhandvalue=0;

    //loops through the Player.Deck.Deck of cards from the first position to the amount of cards that have been dealt
    //adds the value of the current card in the Player.Deck.Deck to the value of the players hand
    for (int i = 0; i<dealer_cards_dealt;i++) {
      println(i+6);
      dealerhandvalue+=Playerr.Deckk.Deck[i+6].CardValue;
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
        if (Playerr.Deckk.Deck[i+6].CardName=="Ace") {
          for (int j = 0; j<cards_dealt;i++) {
            if (Player.Deckk.Deck[j+6].CardName=="6") {

              twist();
            }
          }
        }
      }
    }
    if (dealerhandvalue<=11) {
      for (int i = 0; i<dealer_cards_dealt;i++) {
        //here is where it actually looks for an ace
        if (Playerr.Deckk.Deck[i+6].CardName=="Ace") {
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

  void stick() {
    dealerstick=true;
  }  


  void updateScore(int valuetoadd) {
    score+=valuetoadd;
  } 

  int getValueOfHand() {

    return dealerhandvalue;
  }



  int getScore() {

    return score;
  }

  // Show hand essentially uses the same code as the player does, as the player will only ever have 6 cards, 
  // we only display cards that are >6 for the dealer (cards dealt will be initialised as 6 for the dealer

  //here is where it displayus the hand
  void showHand() {
    //no loop is here so that it doesnt happen frameRate*persecond
    noLoop();
    //loops through the array in the same fashion as the function that gets the value of the hand
    for (int i = 0; i<dealer_cards_dealt;i++) {
      //instead of taking the value of the current position in the array it displays that card to the screen
      //if(i>6){
      Playerr.Deckk.Deck[i+6].DrawCard(i+(100*i)+20, 190, faceUp);

      //println(Player.Deck.Deck[i].CardValue);
      // }
    }
    //println(dealer_cards_dealt);
  }    
  //sets value of hand and cards dealt to 0 and als re-shuffles the Player.Deck.Deck. (might later need to add anotehr varieble in here to 
  //start a new game or something.
  void clearHand() {
    DealInitialCards();
    faceUp=false;
    dealerhandvalue=0;
    Player.Deckk.ShuffleDeck();
  }
}


