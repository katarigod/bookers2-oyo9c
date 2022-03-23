class Message < ApplicationRecord
  # validates :content, presence: true
  belong_to :user
  belong_to :room

  validates :message, presence:true, length:{maximum:140}

end
