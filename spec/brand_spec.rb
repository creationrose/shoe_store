require 'spec_helper'

describe Brand do

  it { should have_many :shoes }

  it 'validates the presence of brand name' do
    brand = Brand.new({:brand_name => "Diana"})
    expect(brand.brand_name).to eq ("Diana")
  end

  it 'validates the length of brand name' do
    brand = Brand.new({:brand_name => "g".*(31)})
    expect(brand.save).to eq (false)
  end
end
