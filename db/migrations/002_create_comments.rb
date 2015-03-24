Sequel.migration do
  change do
    create_table :comments do
      primary_key :id
      String :author, null: false
      String :body, null: false, text: true
      Time :created_at, null: false, default: 'now()'
      foreign_key :article_id, :articles, on_delete: :cascade, null: false
    end
  end
end
