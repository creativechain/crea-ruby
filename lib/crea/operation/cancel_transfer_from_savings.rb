class Crea::Operation::CancelTransferFromSavings < Crea::Operation
  def_attr from: :string
  def_attr request_id: :uint32
end
