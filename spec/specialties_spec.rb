require('spec_helper')

describe(Specialty) do
  describe('#initialize') do
    it('creates a Specialty object') do
      test_spec =  Specialty.new({spec_name: "hearts", id: nil})
      expect(test_spec.spec_name()).to(eq('hearts'))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      expect(Specialty.all()).to(eq([]))
    end
  end

    describe("#save") do
    it("adds a task to the array of saved specialties") do
      test_spec =  Specialty.new({spec_name: "hearts", id: nil})
      test_spec.save()
      expect(Specialty.all()).to(eq([test_spec]))
    end
  end

    describe(".find") do
    it("finds a spec object with a matching id and returns the spec object") do
      test_spec =  Specialty.new({spec_name: "hearts", id: nil})
      test_spec.save()
      test_spec2 =  Specialty.new({spec_name: "zombies", id: nil})
      test_spec2.save()
      expect(Specialty.find(test_spec2.id())).to(eq(test_spec2))
    end
  end

  describe("#all_docs") do
    it("finds all doctors with a matching Specialty id and returns an array of the doctors") do
      test_spec =  Specialty.new({spec_name: "hearts", id: nil})
      test_spec.save()
      id = test_spec.id()
      test_doc = Doctor.new({:doc_name => "Bubba", :spec_id => id, id: nil})
      test_doc.save()
        expect(test_spec.all_docs()).to(eq([test_doc]))
    end
  end
end
