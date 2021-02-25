## CGrow Research Dev Test

Welcome to the CGrow Dev Test. Your goal is to make predictions on the number of crosses you expect a player to make in future football matches. You have been provided with a dataset, as well as some code that splits the dataset into training and test data. Here are the guidelines:

*	You should use the training data to help determine the most important variables for predicting crosses. Some of the variables provided may be useful, some may not. You can use your statistical background as well as your understanding of football to guide which variables to use. 
*	Your goal is not to make ‘perfect’ predictions with the lowest possible residuals. Instead your goal is to make sensible, repeatable predictions that you believe will be useful not just for this Test data, but for other possible future test data. 
*	You should use diagnostic tools to evaluate the performance of your predictions. Some examples of diagnostics have been provided, you may choose to use others. Please include these in your submitted script.
*	Note that some of the variables are only known once the game is completed and therefore should not be used for the purposes of predicting how many crosses the player will make in that match. For example ‘Team.Goals’ will only be known at the end of the match, so cannot be used for predicting how many crosses the player will make in that match.
*	If you wish to use any additional packages to assist with your analysis, please include these by writing library(‘packagename’) at the top of script.
*	You should aim to make your code clear, with comments explaining your processes. You should be able to run the script all at once and the predictions re-generated.
*	Please submit your answer by sending your completed script to cgrowreasearch@gmail.com.

Here is a description of some of the variables provided:

*	PlyID – a unique ID number specific to each player
*	Team.Possession – the percentage of the match for which the player’s team had possession
*	WinProb – the implied probability the team has of winning the game according to the betting markets prior to Kick Off.
*	PlyPosition – the position on the pitch that player played. This is typically known an hour before kick off when lineups are announced. e.g. "AML = Attacking Midfielder Left", "DR = Defender Right", "GK = Goalkeeper".
*	Minutes –  how many minutes the player ended up playing.
*	HmAw – was the player’s team playing at home or away?
*	Crosses – how many crosses the player made in the game, the metric we are trying to predict
