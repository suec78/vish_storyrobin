class TrackingSystemEntry < ActiveRecord::Base

  belongs_to :tracking_system_entry
  has_many :tracking_system_entries

  validates :app_id,
  :presence => true

  validates :data,
  :presence => true

  def self.trackUIRecommendations(options)
  end

  def self.trackRLOsInExcursions(rec,excursion,request,current_subject)
  end

  def self.getRandomRSEngine
    return "ViSHRecommenderSystem"
  end

  def self.getRSCode(str)
    case str
    when "Random"
      "0"
    when "ViSHRecommenderSystem"
       "1"
     when "ViSHRS-Quality"
       "2"
    when "ViSHRS-Quality-Popularity"
      "3"
    else
      nil
    end
  end

  def self.getRSName(str)
    case str
    when "0"
      "Random"
    when "1"
      "ViSHRecommenderSystem"
    when "2"
      "ViSHRS-Quality"
    when "3"
      "ViSHRS-Quality-Popularity"
    else
      nil
    end
  end

end