# frozen_string_literal: true

RSpec::Matchers.define :have_relation do |attribute, relation_class|
  match do
    relation = subject.public_send(attribute)

    if relation.is_a?(Array)
      relation.all?(relation_class)
    else
      relation.is_a?(relation_class)
    end
  end
end
