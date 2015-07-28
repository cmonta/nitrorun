class Course < ActiveRecord::Base
  has_and_belongs_to_many :coureurs
  
  def registered?(coureur)
    self.coureurs.include?(coureur)
 end
end
