shared_examples_for 'commandable object' do |command, options = {}|
  describe "##{command}" do
    it "sends request to /command/#{command}" do
      path = "#{described_class.endpoint}/#{subject.id}/command/#{command}"

      if options.empty?
        args = [command]
        expect(described_class).to receive(:perform_request).with(path, :post)
      else
        args = [command, options]
        expect(described_class).to receive(:perform_request).with(path, :post, options)
      end

      subject.send(*args)
    end
  end
end
