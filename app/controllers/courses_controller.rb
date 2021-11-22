class CoursesController < ApplicationController

    before_action :find_course, only: [:edit, :update, :destroy]
    
    def index 
        @course_list = Course.all
    end   
    
    def new
        @course = Course.new
    end

    def create

        @course = Course.new(course_params)

        if @course.save
            flash[:notice] = "課程已被建立"
            redirect_to courses_path
        else
            render :new
        end

        # redirect_to '/courses'
        # redirect_to courses_path
        # render html: params
    end

    def edit
        # @course = Course.find_by(id: params[:id])
    end

    def update
        # @course = Course.find_by(id: params[:id])

        if @course.update(course_params)
            flash[:notice] = "課程更新完成"
            redirect_to courses_path
        else
            render :edit
        end
    end

    def destroy
        # @course = Course.find_by(id: params[:id])

        if @course.destroy
            flash[:notice] = "課程已刪除"
            redirect_to courses_path
        else
            render :edit
        end
    end

    private 

    def course_params
        params.require(:course).permit(:name, :price, :intro, :hour)
    end

    def find_course
        @course = Course.find_by(id: params[:id])
    end

end