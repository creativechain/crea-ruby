class Crea::Operation::SetWithdrawVestingRoute < Crea::Operation
  def_attr from: :string
  def_attr to: :string
  def_attr percent: :uint16
  def_attr auto_vest: :boolean
end
