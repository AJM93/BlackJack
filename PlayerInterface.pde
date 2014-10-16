interface Player {  
  
  // This is the interface you are expected to implement for both
  // the computer controlled 'dealer' and the human player(s)
  
  // You can change the return types for any of the items in the interface.
  // You can also add arguments two the first two method listed below
  
  void twist(/* you can add an argument here */);               // This method should allow the player to add acard to their hand
  
  void updateValueOfHand(/* you can add an argument here */);   // Updates the the value of the cards the player has in their hand
    
  void stick();        // Called when the player does not want to take another card
  
  void updateScore(int valuetoadd);  // Updates the player's overall score (number of games they have won)
  
  int getValueOfHand(); // Getter method for the value of the cards the player has in their hand
  
  int getScore();      // Getter method for the player's overall score (number of games they have won)
  
  void showHand();     // Used to display the player's hand on screen
  
  void clearHand();    // Used at the end of a round to empty the cards in the player's hand

}

