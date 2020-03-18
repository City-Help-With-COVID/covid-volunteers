class Project < ApplicationRecord
  belongs_to :user

  has_many :volunteers, dependent: :destroy
  has_many :volunteered_users, through: :volunteers, source: :user, dependent: :destroy

  validates :funding_amount, numericality: true

  def volunteer_emails
    self.volunteered_users.collect { |u| u.email }
  end
end
