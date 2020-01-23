class Campaign < ApplicationRecord
  #antes de criar o record e antes da validacao da criacao
  before_validation :set_status, on: :create
  after_validation :set_member, on: :create

  #Sempre quem tem o id da outra tabela é o belongs_to
  belongs_to :user
  has_many :members, dependent: :destroy
  enum status: [:pending, :finished]
  validates :title, :description, :user, :status, presence: true

  private

  #pode ser colocado na migration, mas pode ser setado via metodo
  def set_status
    self.status = :pending
  end

  #Insere automaticamente o criador da campanha como membro
  def set_member
    self.members << Member.create(name: self.user.name, email: self.user.email)
  end
end
