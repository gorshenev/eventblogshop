class AddRawMarkdownToPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.text :raw_markdown
  	end
  end
end
