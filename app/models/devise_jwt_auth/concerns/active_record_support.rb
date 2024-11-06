# frozen_string_literal: true

require_relative 'tokens_serialization'

# ActiveSupport Concern for serializing tokens
module DeviseJwtAuth::Concerns::ActiveRecordSupport
  extend ActiveSupport::Concern

  # For Rails >= 7.2.2
  # attribute :tokens, DeviseJwtAuth::Concerns::TokensSerializationType.new
  if Gem::Version.new(Rails.version) < Gem::Version.new("7.2.2")
    included do
      serialize :tokens, DeviseJwtAuth::Concerns::TokensSerialization
    end
  end

  class_methods do
    # It's abstract replacement .find_by
    def dta_find_by(attrs = {})
      find_by(attrs)
    end
  end
end
