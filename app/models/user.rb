class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  # Associations
  has_and_belongs_to_many :blogs, join_table: :teams, dependent: :destroy

  # Enums
  enum role: [:editor, :admin]

  # Callbacks
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :editor
  end

end
