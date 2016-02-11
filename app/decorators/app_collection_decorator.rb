class AppCollectionDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :per_page, :offset, :num_pages, :total_entries, :total_count
end