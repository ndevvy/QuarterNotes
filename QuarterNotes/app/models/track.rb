# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lyrics     :text
#

class Track < ActiveRecord::Base
  validates :album_id, :name, presence: true

  belongs_to :album
  has_many :notes
  has_one :band, through: :album, source: :band

end
