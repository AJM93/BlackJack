/*

_01
Created the CardClass and the DrawCard method within the class, in the constructer it takes 2 values
one being the number of the card (1-13) the other being the suite (1-4) within the constructer itself
it sets the name of the card, using the card number (for 2-10) if the card number is more than 10, 
it sets its according name (jack,queen,king,ace), it also sets the value of the card (again using the
card number for 2-10) if the card number is more than 10, the card value is set to 10 anyway, if the card
value is 1, its value is set too 11. (Later on in the developement there will need to be code to decide 
whether an ace is worth 1 or 11) however it is not needed yet and may not be handled in the class.

I have tested that all of the if statements are working, simply by creating a card using each of the 
suites, and testing that the card numbers above 10 are showing the correct name. For the sake of 
testing, i have also displayed the value of the cards on the card itself. I am not sure if i will keep 
this in the program.

The drawcard function takes in 2 numbers (cardx and cardy) it then draws a rectangle of a set size
and this position, it then uses the position to draw the card name and suite.

There are 4 cards created in this implement of the program, showing that all 4 suites, the queen, ace etc
are in full working order. And shows the cards both displaying face up and dowm.



_02
In version _02 i am going to create the deck class, the deck class has to create a full deck of cards
(52 cards) these will be put into an array of card objects. It also needs to contain a method that will
shuffle the deck of cards: Note that in the planning document, card is an inner class of deck, so i 
will also be making card an inner class of deck (i made the card class first simply as is was an 
easier way to do it (in my head))
How i will test everything is working correctly:
  - Will first of all check that the array is full after creating it
  - Will then need to make sure that all the elements in the deck array are unique
    will do this by simply going throught the array, and printing its content to the console
    and making sure all of the content is different.
      -Will need to use the same sort of testing technique when testing that the shuffle function is
       working correctly, will need to make sure that the shuffling is always different, and that it is
       actually shuffling the cards.
       
Had a little trouble making sure that the deck was created the right size (as i was using append it just kept
making the array bigger and bigger) and for some reason, when i said to only add an element if the arrays length
was less that 52 it still went to over 100, so i changed this statement to half of this(26) and it is now adding the 
correct elements (using to printtln functions i can see what is being added to the array of objects is unique and 
that is is making a full deck)

I actually chose to make Deck just extend the card class for the time being.
I succeeded in checking that the array was full useing the println functions, and then continued to see if all the elements were different
sinply by displaying each card.

Having trouble with the shuffle deck function, managing to get the cards to move around the deck is easy enough, 
Just strugglind to set the amount of times it moves and making sure its always different.
**MAnaged to get it to not continually loop round by using noLoop(); in the shuffle deck function,
i presume it just did that because the draw() method continually loops.

Tested to see if the data in the arrays were being shuffled and all seems to be working correctly.


_03
Took the Player interface and added it to the program.
Created the player class

Went with the class name human instead of player as the interface is called player. 

noLoop(); and redraw(); funtions causing bother while dealing extra cards to the deck
as we need it not to loop in order to stop the cards constantly shuffeling
but we need to redraw so we can see new cards when they are pulled

Solved this by accing a varieble called player action, in the main program, and basicly
said if the player has not made an action deal initial cards, if not is doesnt. there will most likely be 
something like this implemented in the dealer class as the dealer class is most likely going to implement player and control almost
all of the game.

I had initially planned on using an arrayList() to store the cardsthat the player has, i instead went with the option of
simply storing a varieble that says how many cards they have been dealt, then to draw the cards it simply draws from the first element of the array
to the amount of cards that they have been dealt (uses the same type thing when getting the value of the hand).

Some extra variebles were added here, that were not in the UML diagrams i had made like the value hand string, i also changed the name
of the boolean originally in my UML diagram as the new name is easier to type when coding. There are alo some varieble that are in the 
UML diagrams but are not infact used 

Testing the ace: To test that the ace was being counted as 11 at the right point it was simple, as the first element in the deck array
is infact an ace, to check that it was being counted as a 1 at the proper time it was slightly harder, but after running the program ~30
times it was apparent it was working properly.

Testing that cards were not being dealt if the player was bust or if the player had 21 was simply a case of running the program and playing 
through it.

**NOTE
That just because the variables have not been used in thsi version does not mean that they are nto going to be used in a later version.

Big problam that occurred:
When trying to make human extend the deck class, there was an issue with many of the methods i wanted to call etc, and so i have chose to 
deal with that in a later version. (Big break of encapsulation)


_04
What i intend to do in this version of the program;
    -Implement the button class
    -Possibly create a front page/game page, front page having a button saying play and asking the user to input there name.
    -Implement the Dealer class. (will most likely not implement the dealer AI/'game' method yet. *
    
    **MAYBE**
Deal with the human class extending the deck class, to fix one major encapsulation issue so far in the program.

All functions in the dealer class (That are in the player interface) are working, the dealer AI has not been made yet, but will
be in the next versiom.

Put the mouseClicked function on its own page, as it is going to be used to handle pressing of buttons and so will get 
rather large

Created the dealers AI and tested everything by playing the game. Could be checked easier by fixing the cards that the dealer is deal

Used code that i used in a previous project (some of which was found on previous tutors website) to allow the user to input there name, it then
sets a class variable to that. By default it is just "Player"

there is now a variable called gamemode, which is changed for different pages, for example if gammode is 1 then it asks the user for there name
and after they press play the game mode is set too two and there name is used instead of player, after the player sticks it goes into gamemode 3 
and another button appears allowing them to continue onto the next hand.


  *Note that the Dealer class is very like the player class, and so like the player class there are going to be alot of changes in 
  the variebles in the class compared to the UML diagrams created later, i will most likely make a document to explaing the changes, but will
  at the very least create updated UML diagrams. Alot of the code for methods will be very like the code for the ones in the human class,
  the only differences will be in the cards that are dealt to the dealer and the extra 'AI' method, that may be used to control the game
  (if not, it will just be used to deal with the dealer beign issued cards etc and the Draw() loop/method will deal with the actual game itself.
  
  
_05

**CHANGE MADE TO INTERFACE**
In the interface handed out by the teacher in class there was no option to add an arguement for updatescore();
i decided to add an arguement for this method anywaym, as i have chosen to do the scoring system outside of the 
player/dealer classes, all of the other methods make this very easy (the getters for the value of the dealers and
players hand).
This paired with a setter method for the score, seems like the easiest way to implement the scoring system while keeping
ecapsulation as tight as possible.

Dealt with the continue button when you are in game mode 3 so that when it is pressed it shuffles the deck and then resets the game

Will be implementing the code that allows the dealer to compare hands, and then keep scores.

Implemented the score sstem , that determines the winner of a round according to the value of each players hand



***NOTED BUGS***
OCCASIONALYY when you have 2 aces, it will cont you as bust instead of counting one of them as 1.
Occasionally the dealer will not take a card when deck is less thatn 17
Sometimes the players score wont update on screen (value of hand is still correct)
Sometimes after pressing the stick button (normally on the 5th -7th game) the program would crash,
thanks to a prinln for debugging we see that this is in the loop that chooses when the dealer is to take cars


--- Note that the issue with the loop crashing the program was fixed with a simple counter, saying that the loop could 
only go round 10 times, this seems to have had no effect on the player taking cards and he still seems to be taking them as 
he should be.
--- Note that the issue with the dealer not taking cards when he should seems to be sorted when 
running the program as an exported windows application, this makes me wonder if it is an issue with the code itself 
or processing.
--- Note that the issue with aces also seems to be resolved when running the program after exporting.




Testing the scoring system was simple, through playing through the game and using fixed results and just playing through the game
it was apparent it was in full working order, from now on all tests i do will be done in an exported application, 
as it tends to work better every time.

Out of the 10-20 times i ran the program, it worked perfectly 18-19 of the times, for some reason sometimes it still does nto work properly,
will be doing more work on the part of code that deals with aces in more detail, to ensure that when the dealer is dealt one, it is dealt with before he 
chooses whether or not to deal himself another card (dealer ai seems to be working perfectly, apart from sometimes, for example he will get an 
ace and an 8 and his score will be reduced to 9 appropriately, but the next card will nto actually be taken.


I know that alot of the testing up to this point has been rather unorganised, i thought that a more formal show of results was 
required and so i made a video of a full game (in this version). It will be contained within a folder in _05 and 
will be accompanied by a text file, highlighting areas it shows in working order.



*****ENCAPSULATION BREAK*****
At this point alot of the program has been done, without the player class actually implementing the deck class,
this shows a huge break in encasulation as the player class relies on an actual pre-made deck to work.



_06
The main thing i intend to do is get the highscore system working
This will be done by making a high score class, which will have 3 functions, 1 too add a high score, one to check its place,
and one to display it. Instead of choosing its place in the list with a method, i may make one that instead just sorts the list(s).


--- Now a little bit into making the actual high scores class, and realise i may need methods to export/import the files.

For the saving and loading of the files i used alot of code i used in the finomili project and it was mainly a case of changing some variable names
and types

First shot at saving high score - would save the name but not the high score!
(fixed, was trying to add scores to name file)

Testing that score are being added will most likely be done with screen capping software and making another video,
may just use screenshots if screencapping software is hard to find. Testing that high scores are being stored in the right order will 
be made easier with the ability too add scores and names straight to the files.

For the sake of testing, in this version(maybe others too) the dealers scores can be entered into the highscores list
(because for some reason i lose this game too much)

Used the fact i could manually put data in the files to my advantage when testing that the highscores display system was working, and this showed me
that it was. (Note that they are not yet been showed in the correct order, i will use bubble sord code, to first sort the data in the arraylists containing the 
high scores and names.

High score sorting system was slightly hard to put in place, due to all the redraw's loop()'s etc in the program, but got there in the end.
tested that it was sorting scores by adding random socres to the score file, and naming players in teh score file i was position (1-10)
and then checking that the scores were all in order.

I made it so that the high score page only showed for a set amount of time, it then takes you back to the game over page, so that the user
is given the option to exit again.



_07
In this version i hope to clean up as many of the bugs involving the dealer as i can (so far these are the only bugs i have
found in the program)

Looked through the code for the dealer, it seemed like the value of his hand was not being updated after the ace was dealt with, so 
i added some code to do that, and the issue where the dealer was counting an ace as a 1, when he could use it as 11 (and was not taking any
more cards) has now been fixed.

It also came to my attention that the dealer was infact not looking at his own cards at certain points in the code (was adressing point i instead
of i+6)

For some reason this change created another issue (SOMETIMES when running the program an error would come up saying
that the sketch was trying too much recusion)
-----Sorted this issue (was calling updatevalueofhand when i did not need too (i was manually updating it at that point anyway(adding 10 for ace))

**Just a small note, fixing the issue with the dealer accessing the wrong card, seems to have dealt with the fact that program would sometimes be slightly unresponsive.

The dealer will still sometimes not take another card when the value of his deck is <17, but the amount of times it happens has dramaticly lowered
(around 1 in ten games now)
**UPDATE
  i have now taken the control of this out of the while loop, and put it into a for loop. Problam seems to be taken care of.
  
Dealers ai seems to be working fine now.


Screenshots (gyazo links);
^
May take screen shots for specific thingsm but for the most part changes and features will be highlighted in a shor video for the version.


*/



