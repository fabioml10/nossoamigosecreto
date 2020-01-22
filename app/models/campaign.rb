class Campaign < ApplicationRecord
  #Sempre quem tem o id da outra tabela é o belongs_to
  belongs_to :user
  has_many :members, dependent: :destroy
  before_create :set_status
  before_create :set_member
  enum status: [:pending, :finished]
  validates :title, :description, :user, :status, presence: true

  #pode ser colocado na migration, mas pode ser setado via metodo
  def set_status
    self.status = :pending
  end

  #Insere automaticamente o criador da campanha como membro
  def set_member
    self.members << Member.create(name: self.user.name, email: self.user.email)
  end
end
