class DeckClass extends CardClass {

  CardClass[] Deck = new CardClass[0];

  DeckClass() { 
    super();
  }



  void CreateDeck() {
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

  void swap(int indexA_, int indexB_) {
    //this is the swap method to be used with the ShuffleDeck method, it simply takes in two ints
    //that relate to a place in the deck array it then uses these ints to swap the data in one element of the array
    //to another.

    CardClass holdindexA         = Deck[indexA_];
    Deck[indexA_] = Deck[indexB_];
    Deck[indexB_] = holdindexA;
  }

  void ShuffleDeck() {
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






