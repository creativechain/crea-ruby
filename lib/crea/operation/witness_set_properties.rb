class Crea::Operation::WitnessSetProperties < Crea::Operation
  def_attr owner: :string
  def_attr props: :witness_properties
  def_attr extensions: :empty_array
end
