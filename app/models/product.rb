class Product < ApplicationRecord
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(headers: true) do |csv|
      csv << fields
      all.each do |product|
        csv << product.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: "utf-8") do |row|
      product_hash = row.to_hash
      product = find_or_create_by!(name: product_hash['name'], category: product_hash['category'],prices: product_hash['prices'])
      
    end
  end
end

