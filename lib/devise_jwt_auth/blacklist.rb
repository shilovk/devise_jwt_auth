# frozen_string_literal: true

# Exclude :tokens from serialization based on Rails version
blacklist_attribute = if Gem::Version.new(Rails.version) < Gem::Version.new("7.2.2")
                        Devise::Models::Authenticatable::BLACKLIST_FOR_SERIALIZATION
                      else
                        Devise::Models::Authenticatable::UNSAFE_ATTRIBUTES_FOR_SERIALIZATION
                      end

blacklist_attribute << :tokens