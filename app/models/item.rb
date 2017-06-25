class Item < ApplicationRecord
    def checked?
        !checked_at.blank?
    end
end
