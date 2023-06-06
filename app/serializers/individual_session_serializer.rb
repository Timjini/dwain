class IndividualSessionSerializer < ActiveModel::Serializer
  attributes :id , :user_id, :coach_id, :session_date, :session_time, :student_full_name, :student_email, :student_phone
end
