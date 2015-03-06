require 'spec_helper'

describe Store do

  it { should have_many :shoes }

  it 'validates the presence of a store name' do
    store = Store.new({:store_name => "The O2"})
    expect(store.store_name).to eq ("The O2")
  end

  it 'validates the length of store name' do
    store = Store.new({:store_name => "g".*(31)})
    expect(store.save).to eq (false)
  end

  it 'converts the names of a store to capitalized' do
    store = Store.create({:store_name => "zydeco"})
    expect(store.store_name). to eq ("Zydeco")
  end
end
