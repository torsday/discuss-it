require 'spec_helper'


describe 'SlashdotApi' do

  describe 'initialization' do
    it 'should initialize without an argument' do
      expect(SlashdotApi.new).to be_an_instance_of(SlashdotApi)
    end

    it 'should NOT initialize with an argument' do
      expect{SlashdotApi.new('foo')}.to raise_error()
    end
  end

end


describe 'Slashdot' do

  describe 'initialization' do
    it 'should initialize without an argument' do
      expect(Slashdot.new).to be_an_instance_of(Slashdot)
    end

    it 'should NOT initialize with an argument' do
      expect{Slashdot.new('foo')}.to raise_error()
    end
  end

  describe 'build postings' do
    it 'should create slashdot posting object' do
      slashdot_count = SlashdotPosting.all.length
      expect(slashdot_count).to eq(slashdot_count + 1)
    end

    it 'should not create slashdot posting object if it already exists' do
    end

  end

  describe 'build urls' do
    it 'should create url object' do
      url_count = Url.all.length
      expect(url_count).to eq(url_count + 1)
    end

    it 'should not create url object if it already exists' do
    end
  end

end