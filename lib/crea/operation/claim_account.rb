class Crea::Operation::ClaimAccount < Crea::Operation
  def_attr creator: :string
  def_attr fee: :amount
  def_attr extensions: :empty_array
end
