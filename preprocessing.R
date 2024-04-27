setwd("/Users/hajer/Desktop/CETM25")
# Load required packages
library(readxl)
library(dplyr)
install.packages("writexl")
library(writexl)

# Specify the file path of your Excel file
file_path <- "spending_data.xlsx"

# Function to read and filter data from a worksheet
read_and_filter_data <- function(file_path, sheet_name, start_date, end_date) {
  # Read data from the specified worksheet, using the sixth row as column names and skipping metadata rows
  data <- read_excel(file_path, sheet = sheet_name, skip = 5, col_names = TRUE, na = "[x]")
  
  # Convert the Date column to Date format
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  # Filter data for the specified date range
  data_subset <- data %>%
    filter(Date >= start_date & Date <= end_date)
  
  return(data_subset)
}

# Filter data for the specified date range
start_date <- as.Date("2023-07-01")
end_date <- as.Date("2023-09-30")

# Read and filter data from the "Spending by sector" worksheet
spending_by_sector <- read_and_filter_data(file_path, "Spending by sector", start_date, end_date)

# Read and filter data from the "Spending by age" worksheet
spending_by_age <- read_and_filter_data(file_path, "Spending by age", start_date, end_date)

# Read and filter data from the "Instore v online" worksheet
instore_v_online <- read_and_filter_data(file_path, "Instore v online", start_date, end_date)

# Merge datasets by Date
merged_data <- spending_by_sector %>%
  left_join(spending_by_age, by = "Date") %>%
  left_join(instore_v_online, by = "Date")

# View the summary of the merged dataset
summary(merged_data)

# Find rows with NA values
rows_with_na <- merged_data[apply(is.na(merged_data), 1, any), ]

# Remove rows with NA values
merged_data <- na.omit(merged_data)

merged_data <- select(merged_data, -Total.x)

# Specify the file path for the new Excel file
output_file_path <- "subset_data.xlsx"

# Write the merged data to a new Excel file
write_xlsx(merged_data, output_file_path)
