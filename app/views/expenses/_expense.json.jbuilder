json.extract! expense, :id, :user_id, :amount, :category, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)
