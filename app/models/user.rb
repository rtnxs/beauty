# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true
  validates :name, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :email, format: { with: EMAIL_REGEXP }
  validates :admin, inclusion: { in: [true, false] }
  validates :admin, exclusion: { in: [nil] }
end
