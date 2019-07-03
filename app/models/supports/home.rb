class Supports::Home
  attr_reader :user, :page

  def initialize user, page
    @user = user
    @page = page
  end

  def user_followers
    user_followers = @user.followers.page(@page).per(Settings.user.user_follower_per_page)
      .order_by_column :name
  end

  def user_followed
    user_followed = @user.following.page(@page).per(Settings.user.user_followed_per_page)
      .order_by_column :name
  end

  def users_high_score
    users = Result.limit(Settings.user.user_high_score).order_by_column :grade
  end
end