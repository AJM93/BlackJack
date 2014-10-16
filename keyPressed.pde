//code taken from a project done in HNC year (Work is still my own)
String txt_str="";
  
void keyPressed() {


  int BACKSPACE = 8;
 
  
//code for backspace is taken from vnon.net
      char keyed = key;
      if (keyed == BACKSPACE) { //if back space is hit
        int str_len = txt_str.length();
        if (str_len > 0) {
      txt_str = txt_str.substring(0, str_len - 1); //substring reduces the size of the string by one
        }
      }       else if((txt_str.length() < 11) && (key != CODED)) { // ensures only 9 chars can be inputed and coded characters could nto be inputed
        txt_str += str(keyed);

      }
      Player.Playername = txt_str; //sets node name to txt_str
    }


