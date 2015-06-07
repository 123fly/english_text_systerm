class Four < ActiveRecord::Base
  validates :zuo_hao, uniqueness:{scope: :number, scope: :test_class}

end
