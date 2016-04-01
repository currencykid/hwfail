class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: {medium: "300x300>" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/                                     
	validates :title, presence: true, length: {minimum: 1, maximum: 50}
	validates :description, presence: true, length:  {minimum: 3, maximum: 1000}
  validates :image, presence: true 
end
