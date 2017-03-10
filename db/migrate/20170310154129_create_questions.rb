class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.text :question_text
			t.string :question_topic
			t.binary :is_annonymous
			t.integer :user_id
			t.timestamps
		end
	end
end
