library(shiny)
library(tidyverse)
library(readxl)
library(reshape2)
library(plotly)
library(rsconnect)


spending_data <- read_excel("subset_data.xlsx")

ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"),
    tags$style(HTML("
                    /* Define custom CSS styles */
                    .container-fluid { background-color: #f5f3fa; } 
                    .tab-content { background-color: #ffffff; } 
                    .well-panel-content { display: flex; align-items: center; } 
                    .well-panel-content h3 { margin-right: 10px; margin-bottom: 15px; } 
                    .summary-card { background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); padding: 30px; margin-bottom: 20px; }
                    .summary-card h4 { color: #555555; margin-top: 0; }
                    .summary-card p { color: #777777; }
                    .summary-card i { font-size: 36px; color: #b35bab; }
                    .well-panel { border: 2px solid #b35bab; border-radius: 10px; padding: 30px; margin-bottom: 20px; }
                    .irs-bar { background-color: #c8c8c8 !important; }
                    "))
  ),
  titlePanel("Revolut Spending Trends July - September 2023"),
  tabsetPanel(
    tabPanel("General",
             fluidRow(
               column(12, 
                      wellPanel(
                        div(class = "well-panel-content",
                            h3("Navigating the Dashboard"),
                            tags$i(class = "fas fa-info-circle fa-3x")
                        ),
                        "Click on the 'Spending Trends' tab to explore the various charts and graphs to gain insights into different aspects of spending behavior."
                      )
               ),
               column(6, 
                      wellPanel(
                        div(class = "well-panel-content",
                            h3("About Revolut"),
                            tags$i(class = "fas fa-credit-card fa-3x")
                        ),
                        "Revolut is a financial technology company that offers banking services including prepaid debit cards, currency exchange, cryptocurrency exchange, and peer-to-peer payments."
                      )
               ),
               column(6, 
                      wellPanel(
                        div(class = "well-panel-content",
                            h3("Dashboard Content"),
                            tags$i(class = "fas fa-line-chart fa-3x")
                        ),
                        "This dashboard shows spending trends based on data collected from Revolut users during the period from July to September 2023."
                      )
               ),
               column(6, 
                      wellPanel(
                        div(class = "well-panel-content",
                            h3("About the Revolut Dataset"),
                            tags$i(class = "fas fa-database fa-3x")
                        ),
                        "The Revolut dataset contains anonymised spending data collected from Revolut users."
                      )
               ),
               column(6, 
                      wellPanel(
                        div(class = "well-panel-content",
                            h3("Where to Access the Dataset"),
                            tags$i(class = "fas fa-download fa-3x")
                        ),
                        "You can access the Revolut spending dataset from the following link:",
                        a("Revolut Spending Dataset", href = "https://www.ons.gov.uk/economy/economicoutputandproductivity/output/datasets/revolutspendingondebitcards")
                      )
               ),
               fluidRow(
                 column(3, 
                        div(class = "summary-card",
                            tags$i(class = "fas fa-chart-line fa-3x"),
                            h4("Spending Trends"),
                            p("Explore insights into spending patterns across various categories over time.")
                        )
                 ),
                 column(3, 
                        div(class = "summary-card",
                            tags$i(class = "fas fa-shopping-basket fa-3x"),
                            h4("Top Spending Categories"),
                            p("Discover the most significant spending categories within the dataset.")
                        )
                 ),
                 column(3, 
                        div(class = "summary-card",
                            tags$i(class = "fas fa-user fa-3x"),
                            h4("About Age"),
                            p("Gain insights into spending behaviour based on different age demographics.")
                        )
                 ),
                 column(3, 
                        div(class = "summary-card",
                            tags$i(class = "fas fa-shopping-cart fa-3x"),
                            h4("Online vs. In-Store Shopping"),
                            p("Explore consumer preferences between online and in-store shopping experiences.")
                        )
                 )
               )
             )
    ),
    
    tabPanel("Spending Trends", 
             fluidRow(
               column(4, 
                      plotlyOutput("monthlyBarChart", height = "350px")
               ),
               column(4, 
                      plotlyOutput("trendPlot", height = "350px")
               ),
               column(4, 
                      plotlyOutput("agePlot", height = "300px"),
                      sliderInput("ageRangeSlider", label = "", 
                                  min = min(spending_data$Date), max = max(spending_data$Date),
                                  value = c(min(spending_data$Date), max(spending_data$Date)),
                                  step = 1,
                                  timeFormat = "%d %b",
                                  width = "100%")
               )
             ),
             fluidRow(
               column(4, 
                      plotlyOutput("spendingComparisonPlot", height = "300px"),
                      sliderInput("dateRangeSlider", label = "", 
                                  min = min(spending_data$Date), max = max(spending_data$Date),
                                  value = c(min(spending_data$Date), max(spending_data$Date)),
                                  step = 1,
                                  timeFormat = "%d %b",
                                  width = "100%")
               ),
               column(4, 
                      plotlyOutput("sectorPlot", height = "300px"),
                      sliderInput("datesRangeSlider", label = "", 
                                  min = min(spending_data$Date), max = max(spending_data$Date),
                                  value = c(min(spending_data$Date), max(spending_data$Date)),
                                  step = 1,
                                  timeFormat = "%d %b",
                                  width = "100%")
               ),
               column(4, 
                      plotlyOutput("linePlot", height = "350px")
               )
             )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Convert Date column to Date format
  spending_data$Date <- as.Date(spending_data$Date, format = "%d %b %Y")
  
  # Extract month and year from the Date column
  spending_data$Month <- format(spending_data$Date, "%Y-%b")
  
  # Calculate average spending by month
  monthly_avg_spending <- spending_data %>% 
    group_by(Month) %>% 
    summarise(avg_spending = mean(Total.y))
  
  # Define custom month labels
  custom_labels <- c("2023-Jul" = "Jul", "2023-Aug" = "Aug", "2023-Sep" = "Sep")
  
  # Define colors for each month
  custom_colors <- c("2023-Jul" = "#c8c8c8", "2023-Aug" = "#b35bab", "2023-Sep" = "#c8c8c8")
  
  # Convert Month to a factor with ordered levels
  monthly_avg_spending$Month <- factor(monthly_avg_spending$Month, levels = c("2023-Jul", "2023-Aug", "2023-Sep"))
  
  # Plot the bar chart for average monthly spending
  output$monthlyBarChart <- renderPlotly({
    # Generate the ggplot object
    plot <- ggplot(monthly_avg_spending, aes(x = Month, y = avg_spending, fill = Month)) +
      geom_bar(stat = "identity") +
      scale_fill_manual(values = custom_colors) +  # Define fill colors
      labs(title = "<span style='color:#b35bab;'>August</span> was the Biggest Spending Month",
           y = "Average Spending",
           x = "") +  # Empty string for x-axis label
      scale_x_discrete(labels = custom_labels) +  # Set custom labels for x-axis
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 0, hjust = 1),  # Set angle to 0 for horizontal orientation
            panel.grid.major = element_blank(),  # Remove major gridlines
            panel.grid.minor = element_blank(),  # Remove minor gridlines
            legend.position = "none")  # Remove legend
    
    # Convert ggplot object to plotly object
    ggplotly(plot)
  })
  
  # Convert Date column to Date format
  spending_data$Date <- as.Date(spending_data$Date, format = "%Y-%m-%d")
  
  # Define a function to create the trend plot
  createTrendPlot <- function(spending_data) {
    p <- ggplot(spending_data, aes(x = Date, y = Total.y)) +
      geom_line(color = "#c8c8c8") +
      geom_point(data = spending_data %>% filter(Date %in% as.Date(c("2023-07-24", "2023-08-24"))), 
                 aes(x = Date, y = Total.y), color = "#b7a8e3", size = 2) + 
      geom_point(data = spending_data %>% filter(Date %in% as.Date("2023-09-18")), 
                 aes(x = Date, y = Total.y), color = "#b7a8e3", size = 3) +
      geom_point(data = spending_data %>% filter(Date %in% as.Date("2023-08-02")), 
                 aes(x = Date, y = Total.y), color = "#b35bab", size = 3) +
      geom_point(data = spending_data %>% filter(Date %in% as.Date(c("2023-09-30", "2023-08-31", "2023-07-05"))), 
                 aes(x = Date, y = Total.y), color = "#b35bab", size = 2) +
      labs(title = "Spending <span style='color:#b35bab;'>increased</span> towards the beginning of\n each month and <span style='color:#b7a8e3;'>decreased</span> mid-month",
           x = "",
           y = "Total Spending") +
      theme_minimal() +
      theme(panel.grid.major = element_blank(),
            panel.grid.minor = element_blank())
  
    
    # Add annotations without HTML-like formatting
    p <- p +
      annotate(geom = "text", x = as.Date("2023-09-18") -10, y = 139, 
               label = "Lowest spending day was 18 Sept", color = "#b7a8e3", size = 3) +
      annotate(geom = "text", x = as.Date("2023-08-02"), y = 170, 
               label = "Spending peaked 02 Aug", color = "#b35bab", size = 3) +
      annotate(geom = "text", x = as.Date("2023-07-01") + 35, y = 175,
               label = "",
               color = "black", size = 3.5, hjust = 0, vjust = 0)
    
    return(p)
  }
  
  # Render the trend plot
  output$trendPlot <- renderPlotly({
    ggplotly(createTrendPlot(spending_data))
  })
  
  
  createLinePlot <- function(spending_data) {
    # Convert Date column to Date format
    spending_data$Date <- as.Date(spending_data$Date, format = "%d %b %Y")
    
    
    # Filter data 
    july_17 <- spending_data %>% filter(Date == as.Date("2023-07-17"))
    sept_20 <- spending_data %>% filter(Date == as.Date("2023-09-20"))
    july_17_data <- spending_data %>% filter(Date <= as.Date("2023-07-17"))
    sept_20_data <- spending_data %>% filter(Date >= as.Date("2023-09-20"))
    between_data <- spending_data %>% filter(Date >= as.Date("2023-07-17") & Date <= as.Date("2023-09-20"))
    
    # Plot spending trends for each sector
    p <- ggplot() +
      geom_line(data = spending_data, aes(x = Date, y = `Automotive Fuel`, color = "Automotive Fuel")) +
      geom_line(data = july_17_data, aes(x = Date, y = Retail, color = "Retail Before July 17")) +
      geom_line(data = between_data, aes(x = Date, y = Retail), color = "#c8c8c8") +
      geom_line(data = sept_20_data, aes(x = Date, y = Retail, color = "Retail After Sept 20")) +
      scale_color_manual(values = c("Automotive Fuel" = "#c8c8c8", 
                                    "Retail Before July 17" = "#b35bab",
                                    "Retail After Sept 20" = "#b35bab"
      ),
      breaks = c("Automotive Fuel", "Retail Before July 17", "Retail After Sept 20")) +
      labs(title = "Retail spending <span style='color:#b35bab;'>Exceeded</span> Automotive Fuel\n Beginning of July and After Mid-September",
           x = "",
           y = "Average Spending",
           color = "Sector",
           # Set labels for colors
           fill = "Sector",
           linetype = "Sector",
           shape = "Sector") +
      theme_minimal() +
      theme(panel.grid.major = element_blank(),  # Remove major gridlines
            panel.grid.minor = element_blank(),
            legend.position = "none",  # Remove legend
      ) +
      # Add annotations with custom colors
      annotate("text", x = as.Date("2023-07-17") + 72 , y =  178, 
               label = "Automotive\nFuel", 
               vjust = 1, hjust = 0, size = 2.7, color = "#c8c8c8") + 
      annotate("text", x = as.Date("2023-09-20") + 10, y = 204, 
               label = "Retail", 
               vjust = 1, hjust = 0, size = 2.7, color = "#b35bab") 
    
    return(p)
  }
  
  # Render the line plot
  output$linePlot <- renderPlotly({
    createLinePlot(spending_data)
  })
  
  # Reactive expression to filter data based on slider input
  filtered_data <- reactive({
    spending_data %>%
      filter(Date >= input$dateRangeSlider[1] & Date <= input$dateRangeSlider[2])
  })
  
  # Calculate the average online and in-store spending for the selected date range
  average_spending <- reactive({
    filtered_data() %>%
      summarise(Avg_Online = mean(Online),
                Avg_Instore = mean(100 - Online))
  })
  
  # Render the side-by-side bar plot
  output$spendingComparisonPlot <- renderPlotly({
    # Create the data frame for plotting
    plot_data <- data.frame(Category = c("Online", "In-store"),
                            Average = c(average_spending()$Avg_Online, average_spending()$Avg_Instore))
    
    # Create the side-by-side bar plot
    p <- ggplot(plot_data, aes(x = Category, y = Average, fill = Category)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = paste0(round(Average), "%")), 
                nudge_y = 2, # Adjust this value to move the labels up or down
                size = 3) +
      labs(title = "<span style='color:#b35bab;'>In-store</span> Spending Consistently Exceeded Online \nSpending",
           x = "",
           y = "") +
      theme_minimal() +
      scale_fill_manual(values = c("Online" = "#c8c8c8", "In-store" = "#b35bab")) +  # Color the bars
      theme(panel.grid.major = element_blank(),  # Remove major gridlines
            panel.grid.minor = element_blank(),  # Remove minor gridlines
            legend.position = "none")  # Remove the legend
    
    # Convert ggplot to plotly and remove y-axis
    ggplotly(p) %>% layout(yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  # Define a function to create the age plot
  createAgePlot <- function(filtered_data) {
    # Calculate the average spending for each age group
    average_spending <- filtered_data %>%
      summarise(across(`18-34`:`55+`, ~mean(., na.rm = TRUE)))
    
    # Reshape data for bar plot
    average_spending_long <- average_spending %>%
      pivot_longer(cols = everything(), names_to = "Age_Group", values_to = "Average_Spending")
    
    # Define colors for each age group
    colors <- c("18-34" = "#b35bab", "35-54" = "#c8c8c8", "55+" = "#c8c8c8")
    
    # Plot the average spending for each age group in a bar chart
    p <- plot_ly(average_spending_long, x = ~Age_Group, y = ~Average_Spending, type = 'bar', 
                 color = ~Age_Group, colors = colors) %>%
      layout(title = list(
        text = "<span style='color:#000000;'> <span style='color:#b35bab;'>18 - 34</span> year olds are the biggest spenders</span>",
        x = 0.1,
        xanchor = "left", 
        font = list(
          size = 17 
        )
      ),
      xaxis = list(title = "Age Group", showgrid = FALSE),
      yaxis = list(title = "Average Spending", showgrid = FALSE),
      showlegend = FALSE) 
    
    return(p)
  }
  
  # Render the age plot
  output$agePlot <- renderPlotly({
    
    # Filter the spending data based on the selected date range
    filtered_data <- spending_data %>%
      filter(Date >= input$ageRangeSlider[1] & Date <= input$ageRangeSlider[2])

    createAgePlot(filtered_data)
  })
  
  # Define a function to create the sector plot
  createSectorPlot <- function(filtered_data) {
    # Calculate the average spending for each sector
    average_spending_sector <- filtered_data %>%
      summarise(across(`Automotive Fuel`:`Travel and accommodation`, ~ mean(., na.rm = TRUE)))
    
    # Reshape data for horizontal bar plot
    average_spending_sector_long <- average_spending_sector %>%
      pivot_longer(cols = everything(), names_to = "Sector", values_to = "Average_Spending")
    
    # Find the two longest bars
    max_values <- tail(sort(average_spending_sector_long$Average_Spending), 2)
    
    # Create colour vector based on condition
    colors <- ifelse(average_spending_sector_long$Average_Spending %in% max_values, "#b35bab", "#c8c8c8")
    
    # Create the interactive horizontal bar plot using Plotly with conditional coloring
    p <- plot_ly(average_spending_sector_long, x = ~Average_Spending, y = ~reorder(Sector, Average_Spending), type = 'bar', 
                 marker = list(color = colors, line = list(color = 'black', width = 0.1)), 
                 # Add text labels inside the bars
                 text = ~paste(Sector), 
                 textposition = "inside") %>%
      layout(title = list(
        text = "<span style='color:#000000;'> Users Spend More on <span style='color:#b35bab;'>Automotive Fuel</span> and <span style='color:#b35bab;'>Retail</span>",
        font = list(size = 17)  # Adjust the title font size
      ),
      xaxis = list(title = "Average Spending", showgrid = FALSE),
      yaxis = list(title = "", showgrid = FALSE, showticklabels = FALSE),
      showlegend = FALSE)
    
    return(p)
  }
  
  # Render the horizontal bar plot for total spending by sector
  output$sectorPlot <- renderPlotly({
    # Filter data based on selected date range
    filtered_data <- spending_data %>%
      filter(Date >= input$datesRangeSlider[1] & Date <= input$datesRangeSlider[2])
    
    # Create the sector plot using the filtered data
    createSectorPlot(filtered_data)
  })
  
}
  
# Run the application
shinyApp(ui = ui, server = server)
