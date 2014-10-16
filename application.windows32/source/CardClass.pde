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

  void DrawCard(int CardX, int CardY,boolean tempfaceup) {
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

