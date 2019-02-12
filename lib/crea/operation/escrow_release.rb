class Crea::Operation::EscrowRelease < Crea::Operation
  def_attr from: :string
  def_attr to: :string
  def_attr agent: :string
  def_attr who: :string
  def_attr receiver: :string
  def_attr escrow_id: :uint32
  def_attr cbd_amount: :amount
  def_attr crea_amount: :amount
end
