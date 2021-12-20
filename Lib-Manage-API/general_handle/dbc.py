import mysql.connector
from mysql.connector import Error
import config
try:
    connection = mysql.connector.connect(host=config.db_host,
                                        database=config.db_dbname,
                                        user=config.db_user,
                                        password=config.db_password)
    cursor = connection.cursor(buffered=True)
except Error as e:
    print("Error while connecting to MySQL", e)

