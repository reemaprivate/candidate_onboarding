# frozen_string_literal: true

module OnboardingsHelper
  def max_cv_file_size
    number_to_human_size(CandidateDocument::MAX_FILE_SIZE)
  end
end
