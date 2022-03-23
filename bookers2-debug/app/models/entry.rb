class Entry < ApplicationRecord
  belong_to :user
  belong_to :room
end
