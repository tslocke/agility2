class Init < ActiveRecord::Migration
  def self.up
    create_table :buckets do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :position
    end
    
    create_table :projects do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :stories do |t|
      t.string   :name
      t.text     :description
      t.integer  :effort
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :bucket_id
      t.integer  :owner_id
      t.integer  :assigned_to_id
      t.integer  :position
    end
    
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :username
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :buckets
    drop_table :projects
    drop_table :stories
    drop_table :users
  end
end
