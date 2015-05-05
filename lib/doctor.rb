class Doctor

  attr_reader(:doc_name, :spec_id, :id)

  define_method(:initialize) do |attributes|
    @doc_name = attributes.fetch(:doc_name)
    @spec_id = attributes.fetch(:spec_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doc_obj|
      doc_name = doc_obj.fetch("doc_name")
      spec_id = doc_obj.fetch("spec_id").to_i()
      id = doc_obj.fetch("id")
      doctors.push(Doctor.new({:doc_name => doc_name, :spec_id => spec_id, :id =>id}))
    end
    doctors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (doc_name, spec_id) VALUES ('#{@doc_name}', #{@spec_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |dup_doc|
    self.doc_name().==(dup_doc.doc_name()).&(self.spec_id().==(dup_doc.spec_id()))
  end

  define_singleton_method(:find) do |doc_id|
    search_doc = nil
    Doctor.all().each() do |doc_obj|
      if doc_obj.id().to_i() == doc_id
        search_doc = doc_obj
      end
    end
    search_doc
  end

  define_method(:all_pats) do
    returned_pats = []
    pat_table = DB.exec("SELECT * FROM patients WHERE doc_id = #{self.id()};")
    pat_table.each() do |pat_obj|
      pat_name = pat_obj.fetch("pat_name")
      bday = pat_obj.fetch("bday")
      doc_id = pat_obj.fetch("doc_id").to_i()
      returned_pats.push(Patient.new({pat_name: pat_name, bday: bday, doc_id: doc_id}))
    end
    returned_pats
  end

#SELECT doc_id, COUNT (*) FROM patients GROUP BY doc_id ORDER BY COUNT(*) DESC

end
