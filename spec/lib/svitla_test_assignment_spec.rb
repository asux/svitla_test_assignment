require 'spec_helper'

describe SvitlaTestAssignment do

  describe ".group_by_date" do
    subject { described_class.group_by_date(events) }

    context "with valid input where date as Symbol key" do
      let(:events) { [
        {date: '2014-01-01', a: 5, b: 1},
        {date: '2014-01-01', xyz: 11},
        {date: '2014-10-10', qbz: 5},
        {date: '2014-10-10', v: 4, q: 1, strpm: -99}] }

      let(:output) { [
        {date: Date.parse('2014-01-01'), a: 5, b:1, xyz: 11 },
        {date: Date.parse('2014-10-10'), qbz: 5, v: 4, q: 1, strpm: -99}] }

      it { is_expected.to eq(output) }
    end

    context "with valid input where date is Date object" do
      let(:events) { [
        {date: Date.parse('2014-01-01'), a: 5, b: 1},
        {date: Date.parse('2014-01-01'), xyz: 11},
        {date: Date.parse('2014-10-10'), qbz: 5},
        {date: Date.parse('2014-10-10'), v: 4, q: 1, strpm: -99}] }

      let(:output) { [
        {date: Date.parse('2014-01-01'), a: 5, b:1, xyz: 11 },
        {date: Date.parse('2014-10-10'), qbz: 5, v: 4, q: 1, strpm: -99}] }

      it { is_expected.to eq(output) }
    end

    context "with valid input where date as String key" do
      let(:events) { [
        {'date' => '2014-01-01', a: 5, b: 1},
        {'date' => '2014-01-01', xyz: 11},
        {'date' => '2014-10-10', qbz: 5},
        {'date' => '2014-10-10', v: 4, q: 1, strpm: -99}] }

      let(:output) { [
        {date: Date.parse('2014-01-01'), a: 5, b:1, xyz: 11 },
        {date: Date.parse('2014-10-10'), qbz: 5, v: 4, q: 1, strpm: -99}] }

      it { is_expected.to eq(output) }
    end

    context "when events not injectable" do
      let(:events) { "foo" }
      it { expect{ subject }.to raise_error(TypeError, "events not injectable") }
    end

    context "when event item not hash-like object" do
      let(:events) { [1, 2, 3] }
      it { expect{ subject }.to raise_error(TypeError, "event item not a hash-like object") }
    end

    context "when event item must have :date" do
      let(:events) { [{a: 5, b: 1}] }
      it { expect{ subject }.to raise_error(ArgumentError, "event item must have :date") }
    end

    context "when events item's have not valid date" do
      let(:events) { [{date: '2014-13-01', a: 5, b: 1}] }
      it { expect{ subject }.to raise_error(ArgumentError, "invalid date") }
    end

  end
end
