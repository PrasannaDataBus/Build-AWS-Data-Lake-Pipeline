import os
import sys

import time
from datetime import datetime

import pandas as pd
import numpy as np

from termcolor import colored
import openpyxl
from tabulate import tabulate as tab

from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError
from sqlalchemy.types import VARCHAR, Integer, DateTime

import warnings
from pandas.errors import SettingWithCopyWarning
warnings.simplefilter(action='ignore', category=UserWarning)

# Import File Related
workDirectory = r'C:/Users/xxxx/Downloads/'

today = datetime.today()

# Data Import
DataSet = 'Electric_Vehicle_Population_Data'

# time now
timeNowf1 = time.process_time()

# Read file info
print(colored('\nReading CSV file...........', 'red'))
inputcsv = workDirectory + DataSet + '.csv'

# Get total number of rows in file (without loading all data)
total_rows = sum(1 for _ in open(inputcsv)) - 1  # minus header
print(colored(f"Total rows in file: {total_rows:,}", 'cyan'))

# Ask user how many records to load ---
batch_size = int(input("How many records do you want to load? (e.g. 50000): "))
start_row = int(input("Enter the starting row (0 for beginning): "))

# Load specific chunk
skip_rows = range(1, start_row + 1)  # skip previous rows

# Read file
print(colored('\nRead csv file...........', 'red'))
inputcsv = workDirectory+DataSet+'.csv'
df = pd.read_csv(inputcsv, skiprows=skip_rows, nrows=batch_size)
df.info()
print(colored(f"\nLoaded {len(df)} records (rows {start_row} to {start_row + len(df) - 1})", 'yellow'))
print(tab(df.head(5), headers='keys', tablefmt='psql', showindex=False))

# Load DB Related
pycharmDirectoryLocal = r'C:/Users/xxxx/Root/'
pycharmDirectory = ''

if os.path.isdir(pycharmDirectoryLocal):
    print(colored('\nWe work from ' + pycharmDirectoryLocal, 'green'))
    pycharmDirectory = pycharmDirectoryLocal
    sys.path.append(pycharmDirectory + r'Root/DataLake')

if os.path.isdir(pycharmDirectoryLocal):
    _dbconn = pycharmDirectory + r'/DataLake/_dbparams.py'

# execute - _dbparams
exec(compile(open(_dbconn, 'rb').read(), _dbconn, 'exec'))

# Load data
df.to_sql(
    'aws_test',
    con=engine_aws,
    if_exists='append',  # Replace existing table or 'append' for incremental loads
    index=False,
)
print(colored("Data has been successfully loaded", 'green'))
