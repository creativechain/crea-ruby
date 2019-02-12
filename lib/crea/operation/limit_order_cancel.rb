class Crea::Operation::LimitOrderCancel < Crea::Operation
  def_attr owner: :string
  def_attr orderid: :uint32
end
