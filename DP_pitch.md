Deveoping data products Week 4 Project
========================================================
author: Jake Dougherty
date: 3/16/2019
autosize: true

Overview:
========================================================
The shiny app descirbed in this Presentation was created for
Coursera's class on developing data products.

The App itself is hosted on:
https://jdcoursera.shinyapps.io/corsera_week4_project/

And all the code and documentation can be found in the github repository linked below

https://github.com/jdougherty4/Developing-Data-Products-Week4


Application Description
========================================================


This application uses the arm and caret packages to create a tool for evaluating different
predictive  models. 

The ChickWeight dataset was used for this particular analysis, but this method can be applied to any dataset with a numerical response variable.

When the App is run, four different models are fit to the ChickWeight dataset with the goal of predicting a chickens weight based on their diet and length of diet.

After the models are run, the app allows you to view residual plots side by side for a model of the users choosing. This allows the user to view the accuracy and distribution of errors for the model of choosing.

Application Description Part 2
========================================================

The reactive widgets used are:

- Model 1 input: A selection input which toggles which model the first chart will display
- Model 2 input: A selection input which toggles which model the second chart will display
- Four different slider inputs which toggle the axis of the plots
-   These plots are meant to be viewed on the same scale

R expression displaying plot
========================================================

The plot below displays an example of one of the residual plots for a linear model. 
![plot of chunk unnamed-chunk-1](DP_pitch-figure/unnamed-chunk-1-1.png)

The plot shows that as the weight goes up the accuracy of our predictions get worse.
