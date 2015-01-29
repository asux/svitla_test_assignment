require 'spec_helper'

describe SvitlaTestAssignment do
  let(:events) { [
    {date: '2014-01-01', a: 5, b:1},
    {date: '2014-01-01', xyz: 11},
    {date: '2014-10-10', qbz: 5},
    {date: '2014-10-10', v: 4, q: 1, strpm: -99}] }

  let(:output) { [
    {date: '2014-01-01', a: 5, xyz: 11 },
    {date: '2014-10-10', qbz: 5, v: 4, q: 1, strpm: -99}] }

  describe ".group_by_date" do
    subject { described_class.group_by_date(events) }
    it { is_expected.to eq(output) }
  end
end
