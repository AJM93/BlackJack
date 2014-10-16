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
    void drawButton() {
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

