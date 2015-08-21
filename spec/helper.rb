def stub_get(url)
  stub_request(:get, /.*billogram.*#{url}/)
end
