class Bucket < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :unique
    timestamps
  end
  
  belongs_to :project
  has_many :stories, :order => :position
  
  acts_as_list :scope => :project
  
  def total_effort
    stories.sum(:effort) || 0
  end


  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator?
  end

  def updatable_by?(user, new)
    user.administrator?
  end

  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
