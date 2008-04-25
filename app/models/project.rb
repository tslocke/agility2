class Project < ActiveRecord::Base

  hobo_model

  fields do
    name :string
    timestamps
  end
  
  has_many :buckets, :order => :position, :dependent => :destroy

  
  after_create :create_default_buckets
  
  def create_default_buckets
    %w(Done Now Next Backlog).each do |name|
      buckets.create :name => name
    end
  end

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest?
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
