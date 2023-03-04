class TestimonialsController < ApplicationController    

    def index
        @testimonials = Testimonial.all
        render :index
    end

    def create
        @testimonial = Testimonial.new(testimonial_params)

        if @testimonial.save
          redirect_to testimonials_path, notice: 'Testimonial sent successfully'
        else
          render :index
        end
    end

    private

    def testimonial_params
        params.require(:testimonial).permit(:person, :content, :job)
    end
end
