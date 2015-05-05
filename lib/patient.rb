class Patient
  attr_reader(:pat_name, :bday, :doc_id)

  define_method(:initialize) do |attributes|
      @pat_name = attributes.fetch(:pat_name)
      @bday = attributes.fetch(:bday)
      @doc_id = attributes.fetch(:doc_id).to_i()
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |pat_obj|
      pat_name = pat_obj.fetch("pat_name")
      bday = pat_obj.fetch("bday")
      doc_id = pat_obj.fetch("doc_id").to_i()
      patients.push(Patient.new({pat_name: pat_name, bday: bday, doc_id: doc_id}))
    end
    patients
  end

  define_method(:save) do
    DB.exec("INSERT INTO patients (pat_name, bday, doc_id) VALUES ('#{@pat_name}', '#{@bday}', #{@doc_id});")
  end

  define_method(:==) do |dup_pat|
    self.pat_name().==(dup_pat.pat_name()).&(self.bday().==(dup_pat.bday())).&(self.doc_id().==(dup_pat.doc_id()))
  end

end
