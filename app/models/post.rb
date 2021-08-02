class Post < ApplicationRecord

    def self.month_group_count
        self.all.map {|post| post.ref_date.strftime('%B')}.tally
    end
end
