require('spec_helper')

describe(Patient) do
  describe('#initialize') do
    it('creates a patient object') do
      test_patient = Patient.new('Snoop', '2015-01-01', doc_id)
    end
  end
end
