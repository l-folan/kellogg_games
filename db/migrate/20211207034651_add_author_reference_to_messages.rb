class AddAuthorReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :author_id
    add_index :messages, :author_id
    change_column_null :messages, :author_id, false
  end
end
