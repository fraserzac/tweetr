class CreatePosts < ActiveRecord::Base
   belongs_to :user
   validates :content, length: { maximum: 200 }, presence: true

end
    create_table :posts do |t|
  	t.text :input
  	t.timestamps null: false
    end
  end
end
