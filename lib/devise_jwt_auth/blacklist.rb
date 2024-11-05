# frozen_string_literal: true

# Don't serialize tokens
Devise::Models::Authenticatable::UNSAFE_ATTRIBUTES_FOR_SERIALIZATION << :tokens