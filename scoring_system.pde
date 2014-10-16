//intended to be used for player/dealer. Score1 being pl;ayer.

void scoreSystem(int playerscore,int dealerscore){
  int pointworth=1;
  
  if (playerscore==21){
    //uses the update score setter to edit the players score
    Player.updateScore(pointworth);
  }
  else if(dealerscore==21){
    //uses the update score setter to update the dealers score
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
