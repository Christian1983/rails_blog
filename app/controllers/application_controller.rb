class ApplicationController < ActionController::Base
    before_action :set_data

    def set_data
        @last_posts  = Post.order(ref_date: :desc).limit(3)
        @month_group = Post.month_group_count
    end
end
