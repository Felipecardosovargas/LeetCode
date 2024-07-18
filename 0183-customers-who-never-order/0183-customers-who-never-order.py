import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    # Merge customers and orders DataFrame on id and customerId
    merged = pd.merge(customers, orders, left_on='id', right_on='customerId', how='left')
    
    # Filter rows where customerId is null (indicating no orders placed)
    customers_without_orders = merged[merged['customerId'].isnull()]
    
    # Select only the 'name' column
    customers_without_orders = customers_without_orders[['name']]
    
    # Rename 'name' column to 'Customers' as per expected output
    customers_without_orders = customers_without_orders.rename(columns={'name': 'Customers'})
    
    return customers_without_orders

# Example usage:
customers_df = pd.DataFrame({
    'id': [1, 2, 3, 4],
    'name': ['Joe', 'Henry', 'Sam', 'Max']
})

orders_df = pd.DataFrame({
    'id': [1, 2],
    'customerId': [3, 1]
})

# Call the function
result_df = find_customers(customers_df, orders_df)

print(result_df)
