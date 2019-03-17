# Developing-Data-Products-Week4

This application uses the arm and caret packages to create a tool for evaluating different
predictive models. 

The ChickWeight dataset was used for this particular analysis, but this method can be applied to any dataset with a numerical response variable.

When the App is run, six different models are fit to the ChickWeight dataset with the goal of predicting a chickens weight based on their diet and length of diet.

After the models are run, the app allows you to view residual plots side by side for a model of the users choosing. This allows the user to view the accuracy and distribution of errors for the model of choosing.


The reactive widgets used are:

- Model 1 input: A selection input which toggles which model the first chart will display
- Model 2 input: A selection input which toggles which model the second chart will display
- Four different slider inputs which toggle the axis of the plots
-   These plots are meant to be viewed on the same scale
