class Crea::Operation::ClaimRewardBalance < Crea::Operation
  def_attr account: :string
  def_attr reward_crea: :amount
  def_attr reward_cbd: :amount
  def_attr reward_vests: :amount
end
