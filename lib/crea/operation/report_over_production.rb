class Crea::Operation::ReportOverProduction < Crea::Operation
  def_attr reporter: :string
  def_attr first_block: :string # FIXME signed_block_header
  def_attr second_block: :string # FIXME signed_block_header
end
