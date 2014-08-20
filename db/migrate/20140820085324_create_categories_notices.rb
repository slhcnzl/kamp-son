class CreateCategoriesNotices < ActiveRecord::Migration
  def change
    create_table :categories_notices, :id => false do |t|
    	t.integer :category_id
    	t.integer :notice_id
    end
  end
end