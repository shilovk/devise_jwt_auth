# frozen_string_literal: true

# don't serialize tokens
# New support:
Devise::Models::Authenticatable::UNSAFE_ATTRIBUTES_FOR_SERIALIZATION << :tokens
# Not support:
# Devise::Models::Authenticatable::BLACKLIST_FOR_SERIALIZATION << :tokens
