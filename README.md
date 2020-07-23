# Tic-Tac-Toe


[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

> In this project, we attempted to implement a CLI version of the popular game tic-tac-toe in ruby

## Built With

- Ruby

## Authors

👤 **Ramsey Njire**

- Github: [@RamseyNjire](https://github.com/RamseyNjire)
- Twitter: [@untakenramram](https://twitter.com/untakenramram)
- Linkedin: [Ramsey Njire](https://www.linkedin.com/in/ramsey-njire-51984931/)

👤 **Peris Ndanu**

- Github: [@mimipeshy](https://github.com/mimipeshy)
- Linkedin: [Peris Ndanu](https://www.linkedin.com/in/peris-ndanu-405083193/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.


# game is tic-tac-toe
# consists of 2 players
# each player chooses either 'X' or 'O'. We'll call these their letters
# the board consists of a 3x3 grid ie with 9 cells
# game starts with one player (could be random) entering their letter in any of the cells
# The next player then enters their letter and the game continues in alternating fashion
# rubocop: disable Layout/LineLength
# Objective of the game is to fill in 3 cells in a row with your letter, that is horizontally, vertically, or diagonally.
# A player can seek to fill in cells to win or to block the other player's move.
# game ends in one of 2 scenarios: One player succeeds at filling 3 cells in a row or all cells are filled and no player wins, that is draw

# Here is the game flow
# Computer displays game board and prompts player to pick a cell in which to enter their letter. Cells are numbered 1-9
# Player 1 is 'X' by default, so computer can pick randomly who player 1 is.
# Once player one chooses a cell, computer displays message saying what player 1 did and asks player 2 to make a move in the same fashion
# At each iteration, the computer checks the state of the board to see if either player has won, if the board no longer has open cells
# At each iteration, the computer could also display the board.
# When game is over, computer displays 'game over' message, indicating who won, or indicating that game is a draw.
# Also, computer should not allow players to enter letters in a cell that is already occupied. or enter a number that is not on board.
# Computer assigns letters to players in a hash