# frozen_string_literal: true

if defined?(Pagy)
  require 'pagy/extras/bootstrap'
  require 'pagy/extras/trim'     # No need for page=1
  require 'pagy/extras/overflow' # prevent user form requesting a page from the last resulting page

  Pagy::DEFAULT[:overflow] = :last_page
  # Set default number of items per page as 25
  Pagy::DEFAULT[:items] = 25
end
