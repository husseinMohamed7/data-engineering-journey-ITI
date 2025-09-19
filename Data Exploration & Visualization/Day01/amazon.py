from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv

service = Service("geckodriver")
options = webdriver.FirefoxOptions()
driver = webdriver.Firefox(service=service, options=options)

url = 'https://www.amazon.eg/s?k=samsung&rh=p_89%3Asamsung&language=en&ref=SQEG-WEB-SR301'
driver.get(url)

wait = WebDriverWait(driver, 5) 
wait.until(EC.presence_of_all_elements_located((By.XPATH, "//div[@data-component-type='s-search-result']")))

products_data = []
cards = driver.find_elements(By.XPATH, "//div[@data-component-type='s-search-result']")

for card in cards:
    try:
        title = card.find_element(By.XPATH, ".//h2[@class='a-size-base-plus a-spacing-none a-color-base a-text-normal']").text
    except:
        title = None

    try:
        picture = card.find_element(By.XPATH, ".//img[@class='s-image']").get_attribute("src")
    except:
        picture = None

    try:
        whole = card.find_element(By.CLASS_NAME, "a-price-whole").text
        fraction = card.find_element(By.CLASS_NAME, "a-price-fraction").text
        price = f"{whole}.{fraction}"
    except:
        price = None

    try:
        rate = card.find_element(By.XPATH, ".//span[@class='a-icon-alt']").get_attribute("textContent").split()[0]
    except:
        rate = None

    try:
        reviews = card.find_element(By.XPATH, ".//span[@class='a-size-base s-underline-text']").text
    except:
        reviews = None

    products_data.append({
        "title": title,
        "price": price,
        "picture": picture,
        "rate": rate,
        "reviews": reviews
    })


with open("amazon.csv", "w", newline="", encoding="utf-8-sig") as f:
    writer = csv.DictWriter(f, fieldnames=["title", "price", "picture", "rate", "reviews"])
    writer.writeheader()
    writer.writerows(products_data)

