class Doctor

  attr_reader(:doc_name, :spec_id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
    @spec_id = attributes.fetch(:spec_id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doc_obj|
      doc_name = doc_obj.fetch("doc_name")
      spec_id = doc_obj.fetch("spec_id").to_i()
      doctors.push(Doctor.new({:doc_name => doc_name, :spec_id => spec_id}))
    end
    doctors
  end

end
