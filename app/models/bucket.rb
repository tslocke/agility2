class Bucket < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
  
  belongs_to :project
  has_many :stories, :order => :position
  
  validates_uniqueness_of :name, :scope => :project_id
  
  acts_as_list :scope => :project
  
  def total_effort
    stories.sum(:effort) || 0
  end


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
