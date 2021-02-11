class Like < ApplicationRecord
  belongs_to :user
  belongs_to :media, :polymorphic => true
end
