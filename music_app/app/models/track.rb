class Track < ApplicationRecord
  validates :title,:album_id,:ord, presence: true
  
  
  belongs_to :album,
  foreign_key: :album_id,
  primary_key: :id,
  class_name: :Album
  
end   
