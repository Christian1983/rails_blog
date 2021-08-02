class ApplicationController < ActionController::Base
    before_action :set_data

    def set_data
        @month_group = Post.month_group_count
    end
end
