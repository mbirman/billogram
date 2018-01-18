def stub_post(url)
  stub_request(:post, url_regexp(url))
end

def stub_get(url)
  stub_request(:get, url_regexp(url))
end

def stub_put(url)
  stub_request(:put, url_regexp(url))
end

def stub_delete(url)
  stub_request(:delete, url_regexp(url))
end

def url_regexp(url)
  /.*billogram.*#{url}/
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def raw_fixture(file)
  File.new("#{fixture_path}/#{file}.json")
end

def fixture(file)
  JSON.parse(raw_fixture(file).read)
end

def json_response(file)
  {
    body: raw_fixture(file),
    headers: {
      content_type: 'application/json; charset=utf-8'
    }
  }
end
