class Post < ApplicationRecord

    def self.month_group_count
        #TODO: nicht performant, group in datenbank lösen
        self.all.order(ref_date: :desc).map {|post| post.ref_date.strftime('%B')}.tally
    end
end
