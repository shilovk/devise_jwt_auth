# frozen_string_literal: true

require_relative 'tokens_serialization'

# ActiveSupport Concern for serializing tokens
module DeviseJwtAuth::Concerns::ActiveRecordSupport
  extend ActiveSupport::Concern

  included do
    # serialize :tokens, DeviseJwtAuth::Concerns::TokensSerialization
    before_save :serialize_tokens
    after_find :deserialize_tokens

    def serialize_tokens
      self.tokens = DeviseJwtAuth::Concerns::TokensSerialization.dump(self.tokens)
    end

    def deserialize_tokens
      self.tokens = DeviseJwtAuth::Concerns::TokensSerialization.load(self.tokens)
    end
  end

  class_methods do
    # It's abstract replacement .find_by
    def dta_find_by(attrs = {})
      find_by(attrs)
    end
  end
end
