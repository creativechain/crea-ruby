class Crea::Operation::ResetAccount < Crea::Operation
  def_attr reset_account: :string
  def_attr account_to_reset: :string
  def_attr new_owner_authority: :authority
end
