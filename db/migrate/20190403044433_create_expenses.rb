class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :user, foreign_key: true
      t.float :amount
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
