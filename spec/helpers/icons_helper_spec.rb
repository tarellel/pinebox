# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IconsHelper, type: :helper do
  describe 'icon_sizes' do
    it { expect(helper.icon_sizes(size: '4')).to eq('h-4 w-4') }
    it { expect(helper.icon_sizes(size: '')).to be_blank }
  end
end
