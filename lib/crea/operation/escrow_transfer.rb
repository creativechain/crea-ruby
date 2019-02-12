class Crea::Operation::EscrowTransfer < Crea::Operation
  def_attr from: :string
  def_attr to: :string
  def_attr cbd_amount: :amount
  def_attr crea_amount: :amount
  def_attr escrow_id: :uint32
  def_attr agent: :string
  def_attr fee: :amount
  def_attr json_metadata: :string
  def_attr ratification_deadline: :point_in_time
  def_attr escrow_expiration: :point_in_time
end
