# frozen_string_literal: true

class OnboardingsController < ApplicationController
  before_action :ensure_candidate!
  def new
    @candidate_profile = Onboarding::Initializer.call(user: current_user)
  end

  def edit
    @candidate_profile = current_user.candidate_profile
  end

  def create
    profile = Onboarding::Initializer.call(user: current_user)
    CandidateDocuments::Uploader.call(
      profile: profile,
      file: onboarding_params[:cv]
    )

    redirect_to edit_onboarding_path,
                notice: 'CV uploaded successfully.'
  end

  def update; end

  private

  def ensure_candidate!
    return if current_user.candidate?

    redirect_to root_path,
                alert: 'Only candidates can access onboarding.'
  end

  def onboarding_params
    params.permit(:cv)
  end
end
