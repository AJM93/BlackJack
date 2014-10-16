void mouseClicked() {

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

