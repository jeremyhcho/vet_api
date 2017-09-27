# == Schema Information
#
# Table name: products_variant_values
#
#  id              :integer          not null, primary key
#  variant_id      :integer
#  option_value_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module Products
  class VariantValue < ActiveRecord::Base
    belongs_to :variant
    belongs_to :option_value
  end
end
