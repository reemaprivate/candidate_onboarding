# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :candidate_profile, dependent: :destroy

  enum :role, {
    candidate: 0,
    recruiter: 1,
    admin: 2
  }


end
