class Transaction < ApplicationRecord
  validates_presence_of :invoice_id,
                       :credit_card_number,
                       :result
  belongs_to :invoice
 
  def self.search(params)
    case 
    when params[:id]         then find(params[:id])
    when params[:invoice_id] then find_by(invoice_id: params[:invoice_id])
    when params[:result]     then find_by(result: params[:result])
    when params[:created_at] then find_by(created_at: params[:created_at])
    when params[:updated_at] then find_by(updated_at: params[:updated_at])
    when params[:credit_card_number] then find_by(credit_card_number: params[:credit_card_number])
    end
  end

  def self.search_all(params)
    case 
    when params[:id]         then where(id: params[:id])
    when params[:invoice_id] then where(invoice_id: params[:invoice_id])
    when params[:credit_card_number] then where(credit_card_number: params[:credit_card_number])
    when params[:result] then where(result: params[:result])
    when params[:created_at] then find_by(created_at: params[:created_at])
    when params[:updated_at] then find_by(updated_at: params[:updated_at])   
    end
  end

  def self.random
    order('random()').limit(1)
  end
end
