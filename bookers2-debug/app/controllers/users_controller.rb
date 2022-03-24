class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @weekago_book = @books.created_weekago
    @twoweekago_book = @books.created_twoweekago
    @twoday_book = @books.created_twoday
    @threeday_book = @books.created_threeday
    @fourday_book = @books.created_fourday
    @fiveday_book = @books.created_fiveday
    @sixday_book = @books.created_sixday

    @week = @sixday_book, @fiveday_book, @fourday_book, @threeday_book, @twoday_book, @yesterday_book, @twoday_book
    @week_labels = "6日前", "5日前", "4日前", "3日前", "2日前", "1日前", "今日"

    # @book_by_day = @books.group_by_day(:created_at).size
    # @chartlabels = @book_by_day.map(&:first).to_json.html_safe
    # @chartdatas = @book_by_day.map(&:second)



  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
