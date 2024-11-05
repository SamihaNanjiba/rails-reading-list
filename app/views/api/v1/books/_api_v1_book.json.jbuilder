json.extract! api_v1_book, :id, :title, :author, :description, :publication_year, :archived, :old, :created_at, :updated_at
json.url api_v1_book_url(api_v1_book, format: :json)
