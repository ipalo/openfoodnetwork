FactoryBot.define do
  factory :calculator, class: Spree::Calculator::FlatRate do
    after(:create) { |c| c.set_preference(:amount, 10.0) }
  end

  factory :no_amount_calculator, class: Spree::Calculator::FlatRate do
    after(:create) { |c| c.set_preference(:amount, 0) }
  end

  sequence(:calculator_amount)
  factory :calculator_per_item, class: Calculator::PerItem do
    preferred_amount { generate(:calculator_amount) }
  end

  factory :weight_calculator, class: Calculator::Weight do
    after(:build) { |c|
      c.set_preference(:per_unit, 0.5)
      c.set_preference(:unit_from_list, "kg")
    }
    after(:create) { |c|
      c.set_preference(:per_unit, 0.5)
      c.set_preference(:unit_from_list, "kg")
      c.save!
    }
  end
end
