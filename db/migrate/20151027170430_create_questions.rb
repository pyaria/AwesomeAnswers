class CreateQuestions < ActiveRecord::Migration
  def change
    # the DSL (Domain Specific Language) is a Ruby code with special methods
    # that enables us to achieve a specific task
    # in this case, the DSL for migration enables us to create/drop tables
    create_table :questions do |t|
      # we don't need to specify "id" field because Rails will automatically
      # create an id field that is integer, primary key and autoincrement
      t.string :title # this will create VARCHAR column in DB
      t.text :body # this will create TEXT column in DB

      # this will create two timestamp columns/fields
      # one is created_at and the other is updated_at
      t.timestamps null: false
    end
  end
end
