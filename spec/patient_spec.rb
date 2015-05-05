require('spec_helper')

describe(Patient) do
  describe('#initialize') do
    it('creates a patient object') do
      test_patient = Patient.new({pat_name: 'Snoop',bday: '2015-01-01', doc_id: 1})
      expect(test_patient.pat_name()).to(eq('Snoop'))
    end
  end

  describe('.all') do
    it("returns an empty array") do
      expect(Patient.all()).to(eq([]))
    end
  end
end
