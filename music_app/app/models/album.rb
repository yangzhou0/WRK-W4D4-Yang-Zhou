class Album < ApplicationRecord
  validates :band_id,:title,:year,presence: true
  
  belongs_to :band,
  foreign_key: :band_id,
  primary_key: :id,
  class_name: :Band
  
  
  has_many :tracks,
  foreign_key: :album_id,
  primary_key: :id,
  class_name: :Track
  
end
