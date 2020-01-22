class Member < ApplicationRecord
  #Member possui o campaing_id, portanto, ele é belongs_to
  belongs_to :campaign
  after_save :set_campaign_pending
  validates :name, :email, :campaign, presence: true

  def set_pixel
    self.open = false
    self.token = loop do
      #gera tolken aleatório
      random_token = SecureRandom.urlsafe_base64(nil, false)
      #se existir membro com o mesmo token, sorteia de novo
      break random_token unless Member.exists?(token: random_token)
    end
    self.save!
  end

  protected

  #sempre coloca o status da campanha como pending
  def set_campaign_pending
    self.campaign.update(status: :pending)
  end
end
