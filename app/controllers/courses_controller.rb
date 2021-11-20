class CoursesController < ApplicationController

    # HWpractice part - Getting all data to show the course list in course index page
    def index
        @course_list = Course.all
    end   
    
    def new
        @course = Course.new
    end

    def create

        @course = Course.new(course_params)

        if @course.save
            redirect_to courses_path
        else
            render :new
        end

        # redirect_to '/courses'
        # redirect_to courses_path
        # render html: params
    end

    # HWpractice part - creating actions for edit
    def edit
    end   
    
    # HWpractice part - creating actions for update
    def update
    end

    # HWpractice part - creating actions for delete
    def delete
    end


    private 

    def course_params
        params.require(:course).permit(:name, :price, :intro, :hour)
    end

end