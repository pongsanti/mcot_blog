class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :filename

      t.timestamps
    end
  end
end
