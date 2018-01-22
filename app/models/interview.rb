class Interview < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 2 , deleted: 3}
  belongs_to :user, class_name: 'User', :foreign_key => 'users_id'
  belongs_to :recipient, class_name: 'User', :foreign_key => 'recipient_id'
end
