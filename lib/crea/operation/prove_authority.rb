class Crea::Operation::ProveAuthority < Crea::Operation
  def_attr challenged: :string
  def_attr require_owner: :boolean
end
