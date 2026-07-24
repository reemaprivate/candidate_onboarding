# frozen_string_literal: true

class OnboardingsController < ApplicationController
  def new
    @candidate_profile = current_user.candidate_profile || current_user.build_candidate_profile
  end

  def edit
    @candidate_profile = current_user.candidate_profile
  end

  def create; end

  def update; end
end
