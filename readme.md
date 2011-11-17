Conway's Game of Life
=====================

Conway's Game of Life coded in Ruby using a Test Driven Development approach with RSpec.


Core Engine
-----------


Text-Based UI
-------------

Game of life has a text based user interface that can be used from a command line application such as Terminal.

To run the game of life, first `cd` into the `life` directory. Then run the following command:

    ruby game.rb

The game will then prompt you to initialize the world by specifying its dimensions. This creates an empty world. Next you must add the starting cells to the simulation. You can do this manually to get a specific pattern or use a computer generated pattern instead.

Once the world is initialized, you reach the game's main menu:

    Please choose an option below by typing its number
    [1] Start a new game
    [2] View the current state of the world
    [3] View the world after X generations
    [4] Reset to generation 0
    [5] Exit
    
* [1] Start a new game

This option lets you create a new world without having to restart the program. The steps are exactly the same as when the program first launches.

* [2] View the current state of the world

Outputs the current state of the world to the screen. You are asked whether you want to see the next generation. This allows you to advance the simulation one generation at a time ad infinitum


* [3] View the world after X generations