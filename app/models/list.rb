class List < ApplicationRecord
  belongs_to :todo

  def completed?
    !completed_ad.blank?
  end

end
