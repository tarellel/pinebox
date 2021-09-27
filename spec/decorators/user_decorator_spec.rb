# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  subject { user }

  let(:user) { User.new.extend described_class }

  it { is_expected.to be_a User }
end
