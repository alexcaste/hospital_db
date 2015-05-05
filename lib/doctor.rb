class Doctor

  attr_reader(:doc_name, :spec_id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
    @spec_id = attributes.fetch(:spec_id)
  end


end
