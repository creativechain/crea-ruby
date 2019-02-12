class Crea::Operation::WithdrawVesting < Crea::Operation
  def_attr account: :string
  def_attr vesting_shares: :amount
end
