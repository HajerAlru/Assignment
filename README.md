# Revolut Spending Data Visualisation Dashboard

This project consists of a Shiny application designed to visualize
spending data. The application utilizes various R packages to create
interactive visualizations and download functionality for further
analysis.

## Accessing the Visualisation Product:

You have two options to access the visualisation product: 

1. **Run the R Code:** 
You can run the provided R code to launch the Shiny application locally on your machine. Ensure you have R and the required packages installed. Then, execute the `shinyApp` function in R after setting up the UI and server components. 

2. **Visit the Shinyapps.io Link:** 
The final visualisation product is also deployed on shinyapps.io for convenient access. You can view and interact with the application directly by visiting the following URL:
<https://datahajer.shinyapps.io/CETM25/> 

To run the application, you will need RStudio installed on your machine. Follow these steps to access the visualisations: 
1. Open RStudio. 
2. Load the provided R code
file. 
3. Ensure you have the necessary R packages installed by running
the following commands in the R console:
` install.packages("shiny")    install.packages("plotly")    install.packages("tidyverse")    install.packages("readxl")    install.packages("reshape2")    install.packages("rsconnect")`

## Preprocessing

The spending data has undergone preprocessing to ensure accurate and
meaningful visualizations. This includes cleaning, filtering, and
formatting the data to improve its quality and relevance for analysis.
The pre-processed data used in the visualizations may differ from the
original dataset provided.

## Features

-   Trend plot (Plot 1): Displays spending trends over time, with
    annotations highlighting significant dates.

![GIF Recording 2024-04-25 at 1 12 42 pm](https://github.com/HajerAlru/Assignment/assets/168104134/0ce7d5ef-b96e-4bbb-bc72-8694fa0caae0)


-   Line plot (Plot 2): Visualizes spending trends for different sectors
    over time.
-   Sector plot (Plot 3): Shows average spending across sectors, with
    conditional coloring to highlight top sectors.
-   Age plot (Plot 4): Illustrates average spending by age group, with
    customizable color schemes.
-   Monthly bar chart (Plot 5): Presents average monthly spending, with
    customizable labels and colors.
-   Spending comparison plot (Plot 6): Illustrates the average spending
    comparison between online and in-store purchases. Bars are
    color-coded for visual clarity.

## Download Options

You can download the plots in PNG format by hovering over the plot and
clicking on the camera icon in the top left corner.

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
[bi65ia\@student.sunderland.ac.uk](mailto:bi65ia@student.sunderland.ac.uk){.email}.

## Acknowledgments

I would like to express my gratitude to the University of Sunderland for
providing the educational resources and support necessary for the
completion of this project.
