Sequel.migration do
  change do
    create_table :articles do
      primary_key :id
      String :title, null: false
      String :body, text: true, null: false
      Time :created_at, null: false, default: 'now()'
    end
  end
end
