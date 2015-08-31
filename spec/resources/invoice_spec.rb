require 'spec_helper'

describe Billogram::Invoice do

  subject { described_class.new }

  describe "#send!" do
    it "sends request to /command/send" do
      path = "billogram/#{subject.id}/command/send"
      options = { method: 'Email' }
      expect(described_class).to receive(:perform_request).with(path, :post, options)
      subject.send!(options)
    end
  end

  it_behaves_like 'commandable object', :sell
  it_behaves_like 'commandable object', :resend, { method: 'Email' }
  it_behaves_like 'commandable object', :remind, { method: 'Email' }
  it_behaves_like 'commandable object', :collect
  it_behaves_like 'commandable object', :payment, { amount: 1 }
  it_behaves_like 'commandable object', :credit, { mode: 'full' }
  it_behaves_like 'commandable object', :writeoff
  it_behaves_like 'commandable object', :message, { message: 'test' }
  it_behaves_like 'commandable object', :attach, { filename: 'invoice.pdf', content: '' }
end
