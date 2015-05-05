class Patient
  attr_reader(:pat_name, :bday, :doc_id)

  define_method(:initialize) do
      @pat_name = params.fetch("pat_name")
      @bday = params.fetch("bday")
      @doc_id = params.fetch("doc_id").to_i()
  end

end
