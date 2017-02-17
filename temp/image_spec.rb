require 'spec_helper'

RSpec.describe Image, type: :model do
  describe 'blurring should work' do
    it 'should blur a one pixel transform' do
      input = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,1,0,0],
        [0,0,0,0],
        [0,0,0,0],
      ]

      expected = [
        [0,0,0,0],
        [0,0,0,0],
        [0,1,0,0],
        [1,1,1,0],
        [0,1,0,0],
        [0,0,0,0],
      ]
      image = Image.new(input)
      expect(image.blur).to eq expected
    end

    it 'should blur a two pixel transform' do
      input = [
        [0,0,0,0],
        [0,0,1,0],
        [0,0,0,0],
        [0,1,0,0],
        [0,0,0,0],
        [0,0,0,0],
      ]

      expected = [
        [0,0,1,0],
        [0,1,1,1],
        [0,1,1,0],
        [1,1,1,0],
        [0,1,0,0],
        [0,0,0,0],
      ]
      image = Image.new(input)
      expect(image.blur).to eq expected
    end

    it 'should blur a pixel edge transform' do
      input = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [0,0,0,0],
      ]

      expected = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,1,0,0],
        [1,0,0,0],
      ]
      image = Image.new(input)
      expect(image.blur).to eq expected
    end

  end   # describe
end   # RSpec