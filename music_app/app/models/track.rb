# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
	validates :album, :title, :ord, presence: true
	validates :bonus, inclusion: { in: [true, false] }
	validates :ord, uniqueness: { scope: :album_id }

	belongs_to :album

	has_many :notes
end
