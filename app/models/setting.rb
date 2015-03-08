class Setting < RailsSettings::CachedSettings

  def self.update_list(list)
    list.each do |var, value|
      Setting[var] = value
    end
  end

end
