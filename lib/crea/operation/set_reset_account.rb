class Crea::Operation::SetResetAccount < Crea::Operation
  def_attr account: :string
  def_attr current_reset_account: :string
  def_attr reset_account: :string
end
