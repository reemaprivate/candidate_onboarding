# frozen_string_literal: true

module Onboarding
  class Initializer
    def self.call(...)
      new(...).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      raise ArgumentError, I18n.t('onboardings.unauthorized.candidate_only') unless @user.candidate?

      @user.candidate_profile || @user.create_candidate_profile!
    end
  end
end
