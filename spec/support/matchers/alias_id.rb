# frozen_string_literal: true

RSpec::Matchers.define :alias_id do |attribute|
  match do
    subject.public_send(attribute) == subject.id
  end
end
