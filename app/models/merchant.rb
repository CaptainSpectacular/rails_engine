class Merchant < ApplicationRecord
  validates :name, presence: true

  def self.random
    order('random()').limit(1)
  end

  def self.search(params)
    case 
    when params[:id]         then Merchant.find(params[:id])
    when params[:name]       then Merchant.find_by(name: params[:name])
    when params[:created_at] then Merchant.find_by(created_at: params[:created_at])
    when params[:updated_at] then Merchant.find_by(updated_at: params[:updated_at])
    end
  end

  def self.search_all(params)
    case
    when params[:id]         then Merchant.where(id: params[:id])
    when params[:name]       then Merchant.where(name: params[:name])
    when params[:created_at] then Merchant.where(created_at: params[:created_at])
    when params[:updated_at] then Merchant.where(updated_at: params[:updated_at])
    end
  end
end
