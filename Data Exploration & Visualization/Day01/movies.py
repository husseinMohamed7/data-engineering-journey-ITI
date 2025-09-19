from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv

service = Service("geckodriver")
options = webdriver.FirefoxOptions()
driver = webdriver.Firefox(service=service, options=options)

url = 'https://www.boxofficemojo.com/chart/top_lifetime_gross/?area=XWW'
driver.get(url)

wait = WebDriverWait(driver, 5) 
wait.until(EC.presence_of_all_elements_located((By.XPATH, "//div[@id='table']//tr")))

movies_data = []
rows = driver.find_elements(By.XPATH, "//div[@id='table']//tr")[2:-1] 

for row in rows:
    try:
        rank = row.find_element(By.XPATH, ".//td[1]").text
    except:
        rank = None
    
    try:
        title = row.find_element(By.XPATH, ".//td[2]").text
    except:
        title = None
    
    try:
        lifetime = row.find_element(By.XPATH, ".//td[3]").text
    except:
        lifetime = None
    
    try:
        year = row.find_element(By.XPATH, ".//td[4]").text
    except:
        year = None

    movies_data.append({
        "Rank": rank,
        "Title": title,
        "Lifetime Gross": lifetime,
        "Year": year,
    })

with open("movies.csv", "w", newline="", encoding="utf-8-sig") as f:
    writer = csv.DictWriter(f, fieldnames=["Rank", "Title", "Lifetime Gross", "Year"])
    writer.writeheader()
    writer.writerows(movies_data)
