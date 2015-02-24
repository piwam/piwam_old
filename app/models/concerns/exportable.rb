module Exportable
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |item|
          csv << item.attributes.values_at(*column_names)
        end
      end
    end
  end

end