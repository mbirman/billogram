# frozen_string_literal: true

def build(described_class, fixture_name = nil)
  fixture_name ||= described_class.name.demodulize.underscore

  described_class.new(fixture(fixture_name))
end

def fixture(file)
  raw_fixture = File.open("#{fixture_path}/#{file}.json").read
  JSON.parse(raw_fixture)
rescue Errno::ENOENT
  {}
end

def fixture_path
  File.expand_path('fixtures', __dir__)
end
