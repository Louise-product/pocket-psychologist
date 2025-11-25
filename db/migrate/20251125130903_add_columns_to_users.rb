class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :context, :text
    add_column :users, :completed, :boolean, default: false
  end
end
