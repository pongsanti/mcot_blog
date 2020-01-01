class AddClientToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :client, :string
  end
end
