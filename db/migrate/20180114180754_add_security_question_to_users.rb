class AddSecurityQuestionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :security_question, :string, null: false
  end
end
