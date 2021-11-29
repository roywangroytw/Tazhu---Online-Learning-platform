class ReviewsController < ApplicationController

  before_action :login?

  def create
    # 哪一門課？ course沒有要給view用，所以不需要@，不然會噴404
    course = Course.find(params[:course_id])

    # 用這門課的角度去創review, params 要記得清洗
    @review = course.reviews.build(review_params)
    # 因為有belongs_to所生出來的.user setter方法, 因為資料表有關聯，user_id一定要
    # 我們用merge的方式加在review params裡面
    # review.user = current_user
    # review.user_id = current_user.id

    if @review.save
      # 這邊使用了JS ajax方法不會換頁
      # redirect_to course_path(course), notice: '完成評價'
      # redirect_to course_path(course.id), notice: '完成評價'
    else
      # ...
    end
    
  end

  private

  def review_params
    params.require(:review)
          .permit(:title, :content, :rating)
          .merge(user: current_user)
  end

end
