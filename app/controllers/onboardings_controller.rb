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
    upload_candidate_cv

    redirect_to edit_onboarding_path,
                notice: t('.success')
  rescue ActiveRecord::RecordInvalid
    @candidate_profile = profile

    flash.now[:alert] = t('.upload_failed')

    render :new, status: :unprocessable_content
  end

  def update; end

  private

  def ensure_candidate!
    return if current_user.candidate?

    redirect_to root_path,
                alert: t('onboardings.unauthorized.candidate_only')
  end

  def onboarding_params
    params.permit(:cv)
  end

  def upload_candidate_cv
    document = CandidateDocuments::Uploader.call(
      profile: profile,
      file: onboarding_params[:cv]
    )

    ParseCandidateDocumentJob.perform_later(document)
  end

  def profile
    @profile ||= Onboarding::Initializer.call(user: current_user)
  end
end
