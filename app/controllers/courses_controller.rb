class CoursesController < ApplicationController

    before_action :find_course, only: [:edit, :update, :destroy]
    before_action :login?, except: [:index, :show]
    #(已挪到Application_controller) rescue_from ActiveRecord::RecordNotFound, with: :result_not_found

    
    def index 
        @course_list = Course.all
    end   
    
    def new
        @course = Course.new
    end

    def create

        # @course = Course.new(course_params)
        # 為何這邊不需要加入clean_param? 因為clean params要的目的是因為在頁面上有form filed, 我們clean field傳過來的param
        # @course.user_id = current_user.id

        # 一行抵上面兩行
        @course = current_user.courses.build(course_params)

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
        if @course == nil
            flash[:notice] = "不可以編輯他人課程"
            redirect_to courses_path
        end    
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

    # 拿來使用callback確保某些頁面一定要登入才可以看到，控制權限
    
    def login?
        if not user_signed_in?
            redirect_to sign_in_path, notice: '請先登入'
        end    
    end

    def find_course

        if user_signed_in?

            # @course = Course.find_by(id: params[:id], user_id: current_user.id)
            # 下面這種寫法也可以自帶user_id
            # current_user這邊就是呼叫方法current_user()，然後用他的回傳值(某一個user)去新增課程
            @course = current_user.courses.find(params[:id])
        else
            redirect_to sign_in_path, notice: '請先登入'
        end    
                
        
        # 確保如果找不到課程資料，或者點進去不是自己的課程，會做一些事情
        # 如果不做這件事，使用者可以猜url的pattern去直接存取某個課程
        # begin
        #     @course = current_user.courses.find(params[:id])
        # rescue ActiveRecord::RecordNotFound # exception error
        #     # redirect_to courses_path, notice: '無此資料'
        #     render file: 'public/404.html', layout: false, status: 404
        # end        
    end

end