class Landmark <ActiveRecord::Base
  belongs_to :figure

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect do |x|
      
      x if x.slug == slug

    end
  end
end
