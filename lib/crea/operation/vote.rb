class Crea::Operation::Vote < Crea::Operation
  def_attr voter: :string
  def_attr author: :string
  def_attr permlink: :string
  def_attr weight: :int16
end
