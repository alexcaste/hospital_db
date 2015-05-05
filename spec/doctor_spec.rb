require('spec_helper')

describe(Doctor) do
  describe('#initialize') do
    it('creates a Doctor object') do
      test_doc =  Doctor.new({doc_name: 'Bubba', spec_id: 1, id: nil})
      expect(test_doc.doc_name()).to(eq('Bubba'))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      expect(Doctor.all()).to(eq([]))
    end
  end

    describe("#save") do
    it("adds a task to the array of saved docs") do
      test_doc = Doctor.new({:doc_name => "Bubba", :spec_id => 1, id: nil})
      test_doc.save()
      expect(Doctor.all()).to(eq([test_doc]))
    end
  end

    describe(".find") do
    it("finds a doc object with a matching id and returns the doc object") do
      test_doc = Doctor.new({:doc_name => "Bubba", :spec_id => 1, id: nil})
      test_doc.save()
      test_doc2 = Doctor.new({:doc_name => "Dick", :spec_id => 1, id: nil})
      test_doc2.save()
      expect(Doctor.find(test_doc2.id())).to(eq(test_doc2))
    end
  end
end
