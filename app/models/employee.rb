class Employee < ActiveRecord::Base
     
  attr_accessible :name, :source, :country, :city, :hour_rate, :monthly_rate, :availability, :available, :notes, :email, :skype
  has_many :engagements
  has_many :projects, :through => :engagements


  SOURCE_LOCAL     = 10.freeze
	SOURCE_ELANCE    = 20.freeze
	SOURCE_ODESK     = 30.freeze
	SOURCE_OTHER     = 40.freeze

  SOURCES = {
    SOURCE_LOCAL     => 'local',
		SOURCE_ELANCE    => 'Elance',
		SOURCE_ODESK     => 'oDesk',
		SOURCE_OTHER     => 'Other'
  }

  AVAILABLE         = 10.freeze
	PARTLY_AVAILABLE  = 20.freeze
	NOT_AVAILABLE     = 30.freeze

  AVAILABILITIES = {
    AVAILABLE          => 'Available',
		PARTLY_AVAILABLE    => 'Partly available',
		NOT_AVAILABLE    => 'Not available'
  }

  def source?
    SOURCES[self.source]
  end

  def available?
    AVAILABILITIES[self.availability]
  end
end
