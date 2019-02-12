class Crea::Operation::DeclineVotingRights < Crea::Operation
  def_attr account: :string
  def_attr decline: :boolean
end
