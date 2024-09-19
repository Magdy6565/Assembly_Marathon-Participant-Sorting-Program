# Marathon Participant Sorting Program
# Introduction
The purpose of this microprocessor assembly project is to create a program that sorts marathon participants' numbers and completion times in ascending order. By organizing the data, the program can easily identify the marathon winner based on the shortest completion time. This project uses the 8086 assembly language and implements a step-by-step process to achieve the desired outcome.

# Table of Contents
Project Overview
Program Structure
How to Run
Conclusion
Project Overview
Input:
The program prompts the user to enter marathon participants' numbers and their completion times. This data is stored in two separate arrays:

Number_Of_Player: stores player numbers.
Time_Of_Player: stores completion times.
After displaying the sorted results, the user can either choose to enter new data or exit the program.

Sorting Algorithm:
The program uses the bubble sort algorithm to sort the completion times and rearrange the player numbers accordingly. Bubble sort compares adjacent elements, swapping them if needed, and continues traversing the list until it is sorted.

Sorting Process:

Initialization: Sets up the required variables and prepares the data segment.
Input: The user provides the player numbers and completion times, which are stored in their respective arrays.
Sorting: The program applies bubble sort to the completion times and rearranges player numbers based on the sorted times.
Output: The sorted player numbers and their corresponding completion times are displayed.
Program Structure
Data Segment:
Contains variables and messages used throughout the program.

Limit: Stores the total number of marathon participants.
Number_Of_Player: Stores the participant numbers.
Time_Of_Player: Stores the completion times.
Message1: Prompts the user to enter player numbers.
Message2: Prompts the user to enter completion times.
Message3: Displays sorted player numbers and completion times.
Welcome1: A welcome message shown at the start of the program.
Welcome2: A message giving the user the option to continue entering data or exit.
Code Segment:

Initialization: Initializes the data segment and sets up necessary functions for input and output operations.
Input Phase: Prompts the user to enter player numbers and completion times, storing them in Number_Of_Player and Time_Of_Player.
Sorting Phase: Implements the bubble sort algorithm on the Time_Of_Player array and rearranges Number_Of_Player accordingly.
Output Phase: Displays the sorted results, showing player numbers and corresponding completion times.
How to Run
Set up an 8086 assembly environment using any compatible emulator (e.g., DOSBox or Emu8086).
Load the program code into the assembler.
Follow the prompts to input the number of participants and their completion times.
The program will display the sorted results and ask if you want to enter new data or exit.
Conclusion
This microprocessor assembly project demonstrates the use of the bubble sort algorithm to efficiently sort marathon participants' numbers and completion times in ascending order. It provides a practical solution for determining the marathon winner based on the shortest time. The project highlights the capabilities of assembly language for low-level data manipulation, deepening the understanding of assembly language programming and its real-world applications.
