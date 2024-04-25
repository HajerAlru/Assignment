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


-   Monthly bar chart (Plot 1): Presents average monthly spending, with
    customizable labels and colors.
    
![GIF Recording 2024-04-25 at 1 12 42 pm](https://github.com/HajerAlru/Assignment/assets/168104134/0c2b8b27-bed8-4da5-add9-132337694e63)


-   Trend plot (Plot 2): Displays spending trends over time, with
    annotations highlighting significant dates.
    
![GIF Recording 2024-04-25 at 3 07 51 pm](https://github.com/HajerAlru/Assignment/assets/168104134/0b455aac-adf4-4545-a5e3-c90d36efe5d1)

    
-   Age plot (Plot 3): Illustrates average spending by age group, with
    customizable color schemes.
    
![GIF Recording 2024-04-25 at 3 09 08 pm](https://github.com/HajerAlru/Assignment/assets/168104134/ad0a39e2-7ad2-4e44-b7bd-ca671a9406f6)

-   Spending comparison plot (Plot 4): Illustrates the average spending
    comparison between online and in-store purchases. Bars are
    color-coded for visual clarity.
    
![GIF Recording 2024-04-25 at 3 10 24 pm](https://github.com/HajerAlru/Assignment/assets/168104134/5b8b299e-fdd3-4880-a0f1-3d063969adfa)

    
-   Sector plot (Plot 5): Shows average spending across sectors, with
    conditional coloring to highlight top sectors.
    
![GIF Recording 2024-04-25 at 3 11 13 pm](https://github.com/HajerAlru/Assignment/assets/168104134/1450142d-302a-4f54-b5f5-5691ac6b1f30)


-   Line plot (Plot 6): Visualises spending trends for the top two spending sectors
    over time.
    
![GIF Recording 2024-04-25 at 3 11 45 pm](https://github.com/HajerAlru/Assignment/assets/168104134/cd00efe7-4d45-467e-ba26-59756319bd3f)

## Download Options

You can download the plots in PNG format by hovering over the plot and
clicking on the camera icon in the top left corner.

![GIF Recording 2024-04-25 at 3 22 02 pm](https://github.com/HajerAlru/Assignment/assets/168104134/deae5ba0-e691-4b5f-a6d1-5ed64e000cdd)


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
