import pandas as pd
from sqlalchemy import create_engine

# Connect to your local PostgreSQL database
engine = create_engine("postgresql://postgres:gg@localhost:5432/superstore")

# Read your CSV file
df = pd.read_csv("C:/Users/Ezran Cheah/OneDrive/Desktop/SQL Portfolio/US Superstore data.csv", encoding="latin1")

# Load into PostgreSQL (this will auto-create the table)
df.to_sql("sales", engine, index=False, if_exists="replace")

print("✅ Superstore data loaded successfully!")
