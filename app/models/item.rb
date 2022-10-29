class Item < ApplicationRecord
  belongs_to :user , :dependent => :destroy

  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
