# metycle-movie-challenge

*Project Overview*

This project involves analyzing a movie dataset using PostgreSQL and Python in a Jupyter Notebook environment. The analysis includes querying a PostgreSQL database, performing SQL-based data analysis, and visualizing insights from the data.


Tools Used

PostgreSQL (via Docker)
DBeaver for database interaction
Python (Jupyter Notebook)
Matplotlib & Seaborn for data visualization


Project Structure

Coding Challenge Metycle - Movie Data Analysis.ipynb: The main Jupyter Notebook containing the data import, SQL queries, and visualizations.
metycle_challenge_report.pdf: The final PDF report summarizing the entire analysis.
Data: Contains the original CSV files used for the analysis (titles.csv, ratings.csv, credits.csv).
SQL_Scripts: Contains the SQL scripts used for creating and combining tables.


How to Run the Project

Clone the repository:
git clone <repository_url>

Launch a PostgreSQL container:
docker run --name postgres_db -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres

Use DBeaver to import the CSV files into the PostgreSQL database.
Open the Jupyter Notebook and run all cells to visualize the results.


Conclusion

This challenge demonstrated the ability to work with relational databases, perform SQL queries, and visualize data insights effectively. The entire workflow, from data import to analysis and visualization, was completed using PostgreSQL and Python.
