require 'rails_helper'

RSpec.describe Draper::Decorator do
  let(:subject) { Draper::Decorator.new double('object') }

  describe '#t' do
    context 'with root key' do
      it 'calls the i18n translation with key and options' do
        options = double('options')
        expect(I18n).to receive(:t).with('a', options)
        subject.t('a', options)
      end
    end

    context 'without root key' do
      it 'calls the i18n translation with translation_key, key and options' do
        options = double('options')
        expect(subject).to receive(:translation_key) { 'base' }
        expect(I18n).to receive(:t).with('base.a', options)
        subject.t('.a', options)
      end
    end

    it 'decrypts the correct translation base key' do
      fake_class = double('fake_class')
      expect(fake_class).to receive(:name) { 'FakeUserDecorator' }
      expect(subject).to receive(:class) { fake_class }
      expect(subject.send(:translation_key)).to eq 'decorators.fake_user'
    end
  end
end
