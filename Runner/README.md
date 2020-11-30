# Spotify Naive Bayes Classifier

## File Structure
The 7 files below are included and needed to run this script.

- ./runner.R
- ./playlistDataGrabber.R
- ./getSongData.R
- ./Classifier.R
- ./StdDev/MeanStdDevCR.json
- ./StdDev/MeanStdDevClassical.json
- ./StdDev/MeanStdDevCountry.json
- ./README.md (not needed to run)

All these files can be found on our project's [Github Page](https://github.com/Donny208/CS354GroupProject/tree/main/Runner).

## R Environment
Once you have all these files you will need to be able to run them. R can be difficult to run on a console, so 
our group used the program RStudio which can be downloaded [here](https://rstudio.com/products/rstudio/download/).

Once the program is downloaded, create a project with the exact same file structure as listed above. Once you have done this, simply
run the runner.R program.

1. Go to File -> New Project
![Step 1](https://i.imgur.com/s08ZTV4.png)
2. Pick "New Directory" and then "New Project"
![Step 2](https://i.imgur.com/VteWET9.png)
3. Name the project "NBC", pick a location for the project, then click "Create Project".
![Step 3](https://i.imgur.com/qnbgjbY.png)
4. Make sure all files you previously downloaded are in the project folder
![Step 4](https://i.imgur.com/J5ootQK.png)
5. Open runner.R and in the top left click source
![Step 5](https://i.imgur.com/F77l9dg.png)
6. The code should be running in the bottom left terminal if everything was installed correctly.
![Step 6](https://i.imgur.com/nFy06ps.png)

## General Information
- The runner.R code has 2 functions: Grabbing a playlist and formatting it into a json file, and taking a song id, and predicting what genre it is based off our Naive Bayes Classifier.
- An issue might arise due to Spotify requiring an Authentication Token from their developer portal. We have supplied one in our code which should work, but if not you will have to 
create one of these tokens on the [developer dashboard](https://developer.spotify.com/dashboard/applications/).
The project should have the same structure as below.
![DD](https://i.imgur.com/tEvj1Az.png)

Once created, you will have to copy the client secret and client id into the client_id and client_secret environment variables.
