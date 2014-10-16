class HighScore {

  //most of this code will be taken from an old project (the same one as before) note that all code was done by me.

  ArrayList<String> names;
  ArrayList<Integer> scores;

  HighScore() {
    names = new ArrayList();
    scores = new ArrayList();
  } 

  void swapName(int indexA_, int indexB_) {
    String holdindexA         = names.get(indexA_);
    names.set(indexA_, names.get(indexB_));
    names.set(indexB_, holdindexA);
  }
  void swapScore(int indexA_, int indexB_) {
    int holdindexA         = scores.get(indexA_);
    scores.set(indexA_, scores.get(indexB_));
    scores.set(indexB_, holdindexA);
  }
  int startIndex = 0;

  void SortHighScores() {
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







  void ShowHighScores() {
    for (int i = 0; i<scores.size(); i++) {
      if(i<10){
      text(names.get(i)+"       "+scores.get(i), 150, 100+(20*i));
      }
    }
  }



  void AddHighScore(String Name, int Score) {
    names.add(Name);
    scores.add(Score);
  }

  void SaveHighScores() {
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

  void LoadHighScores() {

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
        int tempscore = int(line); //splits the lines into pieces using there tabulation


        //


        scores.add(tempscore); //creates names with the data found in the file
      }
    }
  }
}

