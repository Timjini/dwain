class IndividualSessionSerializer < ActiveModel::Serializer
  attributes :id , :user_id, :coach_id, :session_date, :session_time, :user_full_name, :user_email, :user_phone
end
