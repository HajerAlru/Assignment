# Revolut Spending Data Visualisation Dashboard

This project consists of a Shiny application designed to visualise
spending data. The application utilises various R packages to create
interactive visualisations and download functionality for further
analysis.

## Accessing the Visualisation Product:

You have three options to access the visualisation product: 

1. **Visit the Shinyapps.io Link:** 
The final visualisation product is deployed on shinyapps.io for convenient access. You can view and interact with the application directly by visiting the following URL:
<https://datahajer.shinyapps.io/CETM25/>

2. **Run the R Code:** 
You can run the provided R code to launch the Shiny application locally on your machine. Ensure you have R and the required packages installed. Then, execute the `shinyApp` function in R after setting up the UI and server components. 

To run the application, you will need RStudio installed on your machine. Follow these steps to access the visualisations: 

a. Open RStudio. 

b. Load the provided R code file. 

c. Ensure you have the necessary R packages installed by running
the following commands in the R console:

`install.packages("shiny")    install.packages("plotly")    install.packages("tidyverse")    install.packages("readxl")    install.packages("reshape2")    install.packages("rsconnect")`

3. **Running the Dashboard Locally:**
To run the dashboard locally, follow these steps:

a. Clone the Repository:
If you haven't already, you'll need to clone the repository that contains the dashboard project. This step downloads a copy of the project files to your local machine.
`git clone https://github.com/HajerAlru/Assignment.git`

b. Navigate to the Project Directory:
Once the repository is cloned, navigate into the project directory using the command line. This is where all the project files are stored.
`cd your-repository`

c. Install Dependencies:
Before running the dashboard, you need to make sure you have all the necessary dependencies installed. This typically involves R packages required by the dashboard.
`Rscript -e "install.packages(c('shiny', 'plotly', 'tidyverse', 'readxl', 'reshape2', 'rsconnect'))"`

d. Run the Dashboard:
Once the dependencies are installed, you can run the dashboard using R. This command starts the local server that hosts the dashboard.
`R -e "shiny::runApp('./')"`

e. Access the Dashboard:
With the dashboard running locally, you can access it through your web browser. Open your preferred browser and go to URL specified in the terminal output.

For example, the terminal might display a message like:
`Listening on http://127.0.0.1:5832/`

This will load the dashboard interface in your browser, allowing you to interact with it just like any other web application.

## Preprocessing

The Revolut spending data has undergone preprocessing to ensure accurate and
meaningful visualisations. This includes cleaning, filtering, and
formatting the data to improve its quality and relevance for analysis.
The pre-processed data used in the visualisations may differ from the
original dataset provided. Refer to the data source to access the original 
dataset.

## Features

### General Tab

- Navigating the Dashboard:
Provides guidance on exploring various charts and graphs for insights into spending behaviour.

- About Revolut:
Brief information about Revolut, the financial technology company providing the dataset.

- Dashboard Content:
Overview of the dashboard's purpose and data source.

- About the Revolut Dataset:
Description of the anonymised spending data collected from Revolut users.

- Where to Access the Dataset:
Link to access the Revolut spending dataset.


### Spending Trends Tab

-   Monthly bar chart (Plot 1): Presents average monthly spending, with
    customisable labels and colors. Hover over the bars to view detailed spending data for each month.
    The chart shows that spending peaked in August, indicating higher spending during that month compared to others.

![GIF Recording 2024-04-29 at 5 50 46 pm](https://github.com/HajerAlru/Assignment/assets/168104134/8eef323f-4b68-444b-9dd0-5b3df2b243de)


-   Trend plot (Plot 2): Displays spending trends over time, with
    annotations highlighting significant dates. Hover over the line to view specific spending amounts and dates.

    The plot indicates a significant increase in spending on August 2nd and decrease in spending on September 18th.
    
![GIF Recording 2024-04-29 at 5 51 07 pm](https://github.com/HajerAlru/Assignment/assets/168104134/f86a3650-c4bc-4b8a-9d53-08ae9361dff4)

    
-   Age plot (Plot 3): Illustrates average spending by age group, with
    customisable color schemes. Hover over the bars to view specific spending amounts for each age group. Move the slider to adjust the dates and observe spending trends over different time periods.

    The chart reveals that the 18-34 age group tends to spend the most, followed by the 35-54 age group.
    

![GIF Recording 2024-04-29 at 5 51 36 pm](https://github.com/HajerAlru/Assignment/assets/168104134/b14bbc21-48e1-4195-ae7e-1b37b07b4d7f)


-   Spending comparison plot (Plot 4): Illustrates the average spending
    comparison between online and in-store purchases. Bars are
    colour-coded for visual clarity. Hover over the bars to view specific spending amounts for each category. Move the slider to adjust the dates and observe spending trends over different time periods. 

    The plot shows that in-store spending consistently exceeds online spending throughout the observed period.
    

![GIF Recording 2024-04-29 at 5 52 19 pm](https://github.com/HajerAlru/Assignment/assets/168104134/d8c3b544-ce3b-4069-839f-72288a20b0e0)

    
-   Sector plot (Plot 5): Shows average spending across sectors, with
    conditional colouring to highlight top sectors. Hover over the bars to view specific spending amounts for each sector. Move the slider to adjust the dates and observe spending trends over different time periods.

    The plot indicates that automotive fuel and retail are the top two sectors. 

    
![GIF Recording 2024-04-29 at 6 18 39 pm](https://github.com/HajerAlru/Assignment/assets/168104134/6675ac00-abce-4079-90f1-2a385ce24ff4)


-   Line plot (Plot 6): Visualises spending trends for the top two spending sectors
    over time. Hover over the lines to compare spending patterns between the selected sectors.

    The plot shows that retail was the top spending sector, surpassing automotive fuel, in the beginning of July and after mid-September.
    
![GIF Recording 2024-04-29 at 5 53 27 pm](https://github.com/HajerAlru/Assignment/assets/168104134/7b860696-d0d0-4806-bdb7-f20b6797cfdd)


## Download Options

You can download the plots in PNG format by hovering over the plot and
clicking on the camera icon in the top left corner.

![GIF Recording 2024-04-29 at 6 20 57 pm](https://github.com/HajerAlru/Assignment/assets/168104134/4888f428-70b5-417f-8835-f80976eb908d)


## Contributing

Feedback, bug reports, and feature requests are welcome. Please submit
them by contacting the project maintainers directly or through any
available communication channels. Your input helps improve the
application and ensures that it meets the needs of its users.

## License

This project is licensed under the MIT License.

## Credits

Original data source: [Office for National
Statistics](https://www.ons.gov.uk/economy/economicoutputandproductivity/output/datasets/revolutspendingondebitcards)

## Contact

For questions or further information, feel free to contact the project
maintainers at
[bi65ia\@student.sunderland.ac.uk](mailto:bi65ia@student.sunderland.ac.uk)

## Acknowledgments

I would like to express my gratitude to the University of Sunderland and my tutors for
providing the educational resources and support necessary for the
completion of this project.
