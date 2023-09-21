class IndividualSession < ApplicationRecord
    before_validation :extract_time_from_session_time
    belongs_to :user
    belongs_to :coach

    private

    def extract_time_from_session_time
        if session_time.present?
            self.session_time = session_time.strftime("%H:%M")
        end
    end
end