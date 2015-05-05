class Specialty
  attr_reader(:spec_name, :id)

  define_method(:initialize) do |attributes|
    @spec_name = attributes.fetch("spec_name")
    @id = attributes.fetch("id").to_i()
  end


    define_singleton_method(:all) do
      returned_spec = DB.exec("SELECT * FROM specialties;")
      specialties = []
      returned_spec.each() do |spec_obj|
        spec_name = spec_obj.fetch("spec_name")
        id = spec_obj.fetch("id").to_i()
        specialties.push(Specialty.new({:spec_name => doc_name, :id =>id}))
      end
      specialties
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO specialties (spec_name) VALUES ('#{@spec_name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do |dup_spec|
      self.spec_name().==(dup_spec.spec_name()).&(self.id().==(dup_spec.id()))
    end

    define_singleton_method(:find) do |spec_id|
      search_spec = nil
      Specialty.all().each() do |spec_obj|
        if spec_obj.id() == id
          search_spec = spec_obj
        end
      end
      search_spec
    end

    define_method(:all_docs) do
      returned_docs = []
      doc_table = DB.exec("SELECT * FROM doctors WHERE spec_id = #{self.id()};")
      doc_table.each() do |doc_obj|
        doc_name = doc_obj.fetch("doc_name")
        spec_id = doc_obj.fetch("spec_id").to_i()
        returned_doc.push(Doctor.new({:doc_name => doc_name, :spec_id => spec_id}))
      end
      returned_doc
    end

  # #SELECT doc_id, COUNT (*) FROM patients GROUP BY doc_id ORDER BY COUNT(*) DESC
  #
  end
