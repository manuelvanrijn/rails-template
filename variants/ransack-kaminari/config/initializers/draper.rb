# allow kaminari's pagination methods
Draper::CollectionDecorator.delegate :current_page, :total_pages, :limit_value,
                                     :total_count, :entry_name, :offset_value,
                                     :last_page?
