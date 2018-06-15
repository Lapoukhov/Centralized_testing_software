## Centralized testing software
### The program simulates the calculation of the result for centralized testing.
### Course Project
### Task:
The software should include several basic testing items. For the Russian and Belarusian languages, assign tasks with several variants of answers in Part A. The calculation of the final test ball must be performed using the weighting factors of the complexity of each task. This program should independently form the applicants' forms in a given amount. To create a custom form, make a choice: generate a program or download ready. Answers to assignments for the relevant items can be presented in the form of numbers or words. All data on forms, coefficients, answers, the number of correctly executed tasks should be saved to files for viewing and analysis.
To develop a software for DH, it is necessary to implement the following functions:

• Software generation of responses for all test tasks.

• Formation of applicants' forms.

• Counting the number of applicants who correctly completed the assignment.

• Determination of the weighting coefficients of tasks.

• Save all data to a text file.

• Download data from a text file.

• A score for a multi-choice task.

• Automatic verification of results.

• Save the history of passing the test to a file.

Subjects:

•	Mathematics

•	Russian language

•	Belarusian language

• Biology

• Physics

• Chemistry

• History of Belarus

### Installattion and use manual:

To start using the program, you must run the MyProgramm.exe file. After the program is opened, a window will appear.

![default](https://user-images.githubusercontent.com/37573044/41461309-07c66d04-7098-11e8-84aa-2fdb91d624ed.png)

The program consists of 3 pages: "Home", "Test", "About the program". Working with the application starts with the main page. Before starting the work, the user can familiarize himself with the instruction for this application by clicking on the button "Read the instruction". After clicking on the button, the page "About the program" opens, on which there is the instruction itself, consisting of 7 items, which details how to pass the test and find out the final score. At the very bottom of the program window is the control panel with buttons: "Home" and "Close the program". By clicking on the "Home" button at any time, you can switch to the first page of the application. To exit the program, click on the button "Close the program". Next, the program displays a warning and prompts you to choose whether to close or continue. This option was introduced so that if the button was accidentally, you could cancel the application's closing. On the main page of the program you can go to the actual testing. It is necessary to click the "Start testing" button. After clicking on the button, the page of the "Test" program opens, on which the entire testing process is carried out. A list of items for testing appears on the screen. When one of the suggested items is selected, a panel will appear for further work. This panel displays the name of the subject and three mandatory items with information on what to do in order to get the result. The first point: to establish the number of applicants who have completed the testing in this subject. It is necessary to click on the white rectangular area next to the first item and enter from the keyboard a positive integer not less than one. There are no restrictions on the maximum number, but testing showed that the higher the number of entrants, the slower the program will analyze the data and count the result, so it is recommended to enter a four-digit number for the optimal speed of program execution.
The second point: choose the way to form the user form. The form can be generated programmatically or downloaded ready. In the Download folder are the forms for downloading, for each subject your form, the name of the blank number indicates the number of tasks, after the name of the subject in the abbreviation is written. These forms can be edited by the user before starting the download.
Third point: click on the "Final score" button to find out the result. After the program automatically calculates the result and displays it. After performing the test for each subject, you can see all the data on forms and coefficients. They are in the appropriate folders. After the application is closed, the program allows the user to view the history of the test results. All results are stored in the "Test history" folder in the corresponding text documents, the name of which indicates the date of testing.

### Scheme of the algorithm:
![360__1](https://user-images.githubusercontent.com/37573044/41412309-40357866-6fe8-11e8-9e2d-643a98a5811b.jpg)
