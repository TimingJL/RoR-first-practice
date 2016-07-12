class Event < ApplicationRecord
	has_many :attendees # 複數
	belongs_to :category
	has_one :location, :dependent => :destroy
    has_many :event_groupships
    has_many :groups, :through => :event_groupships	
    has_many :attendees, ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC") }, :dependent => :destroy

end
