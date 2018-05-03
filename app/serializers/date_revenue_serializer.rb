class DateRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    "%.2f" % (object / 100)
  end
end
