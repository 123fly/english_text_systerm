class Four < ActiveRecord::Base
  validates :user_id, :name, :card, :ban_ji, presence: true
  validates :user_id, :card,uniqueness: {case_sensitive: false}

end
