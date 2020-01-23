class RaffleService

  def initialize(campaign)
    @campaign = campaign
  end

  def call

    return false if @campaign.members.count < 3

    results = {}
    #quem vai tirar
    members_list = @campaign.members
    #quem vai ser tirado
    friends_list = @campaign.members
    i = 0

    while(members_list.count != i)
      #pega primeiro membro da lista, 0
      m = members_list[i]
      i += 1

      #loop infinito que para quando recebe um break
      loop do
        #pega outro membro aleatório
        friend = friends_list.sample

        #verifica se o membro pegou ele mesmo
        if friends_list.count == 1 and friend == m
          results = {}
          members_list = @campaign.members
          friends_list = @campaign.members
          i = 0
          break
        elsif friend != m and results[friend] != m
          results[m] = friend
          friends_list -= [friend]
          break
        end
      end
    end
    results
  end
end