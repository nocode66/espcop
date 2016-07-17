class AddCatogoriesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :category, index: true
  end
end
