## TOPIC: Amazon Sales Dataset Visualization

## Introduction

This Shiny application visualizes Amazon sales data using interactive pie and bar charts. The data is sourced from a CSV file containing information about women's fashion sales on Amazon.

## Features

- *Pie Chart*: Visualizes the distribution of ratings for women's fashion products on Amazon.
- *Bar Chart*: Displays the frequency of each rating category in a bar chart format.
- *Download Charts*: Allows users to download the generated charts as HTML files for offline viewing.

## Installation

To run the application locally, follow these steps:

1. Ensure you have R and RStudio installed on your system.
2. Clone this repository to your local machine.
3. Install the required R packages by running the following commands in RStudio:
    R
    install.packages("shiny")
    install.packages("plotly")
    install.packages("readr")
    
4. Open the app.R file in RStudio.
5. Set the working directory to the directory containing the CSV file (Womens Fashion.csv).
6. Click on the "Run App" button in RStudio to launch the Shiny application.

## Usage

Once the application is running, follow these steps:

1. Click on the "Generate Charts" button to generate the pie and bar charts.
2. Explore the interactive charts to analyze the distribution of Amazon sales ratings.
3. Click on the "Download Charts" button to download the generated charts as HTML files.

## Dataset

The dataset used in this application (Womens Fashion.csv) contains the following columns:

- product_name: Name of the women's fashion product.
- price: Price of the product.
- ratings: Ratings given by customers (1 to 5 stars).
- number_of_reviews: Number of reviews for the product.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---

You can customize this README according to your specific project details and requirements.
