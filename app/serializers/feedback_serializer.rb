class FeedbackSerializer < ActionModel::Serializer
    attributes :id , :user , :rating , :created_at , :updated_at, :student_performance, :coach_id


    def user
        user = User.find(object.user_id)
        return user if user
    end

    def student_perfomance
        {
            speed: object.student_perfomance["speed"], 
            endurance: object.student_perfomance["endurance"],
            technique: object.student_perfomance["technique"], 
            consistency: object.student_perfomance["consistency"],
            race_strategy: object.student_perfomance["race_strategy"], 
            mental_status: object.student_perfomance["mental_status"],
            attitude: object.student_perfomance["attitude"]
        }

    end
end