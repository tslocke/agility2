class Story < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :markdown
    effort      Effort
    
    timestamps
  end
  
  belongs_to :bucket
  belongs_to :owner,       :class_name => "User"
  belongs_to :assigned_to, :class_name => "User"
  
  acts_as_list :scope => :bucket

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest? && position.nil?
  end

  def updatable_by?(user, new)
    !user.guest?
  end

  def deletable_by?(user)
    !user.guest?
  end

  def viewable_by?(user, field)
    !user.guest?
  end

end
