Hanami::Model.migration do
  change do
    create_table :gif do
      primary_key :id

      column :giphy_id,  String, null: false
      column :url, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
