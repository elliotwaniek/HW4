class Entry < ApplicationRecord
  has_one_attached :uploaded_image
  belongs_to :place
end
