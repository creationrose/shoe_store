require 'spec_helper'

describe Shoe do

  it { should belong_to :store }

  it { should belong_to :brand }

end
