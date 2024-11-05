# frozen_string_literal: true

require_relative 'tokens_serialization'

# ActiveSupport Concern for serializing tokens
module DeviseJwtAuth::Concerns::ActiveRecordSupport
  extend ActiveSupport::Concern

  # Not support for Rails 7.2.2
  # Used in model User:
  # attribute :tokens, DeviseJwtAuth::Concerns::TokensSerializationType.new
  # included do
  #   serialize :tokens, DeviseJwtAuth::Concerns::TokensSerialization
  # end

  class_methods do
    # It's abstract replacement .find_by
    def dta_find_by(attrs = {})
      find_by(attrs)
    end
  end
end
