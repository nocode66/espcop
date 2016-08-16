class Newsletter < ApplicationRecord
  validates :date, presence: true
  validates :title, presence: true
  validates :url, :url => true
end
