class Comment < ActiveRecord::Base
　belongs_to :keiziban
  belongs_to :user
end
