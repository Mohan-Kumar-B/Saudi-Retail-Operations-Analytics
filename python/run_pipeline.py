from data_cleaning import clean_sales, clean_customers, clean_reference
from data_validation import run_checks

clean_sales()
clean_customers()
clean_reference("products.csv","product_id")
clean_reference("stores.csv","store_id")
run_checks()

import analysis
print("Pipeline completed successfully.")
