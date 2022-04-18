class Word < ApplicationRecord
  validates :name, presence: true, length: {is: 5}, uniqueness: { case_sensitive: false }
  before_save   :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end
