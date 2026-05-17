test_cases = [
  "osc_message_test.jl",
  "osc_bundle_test.jl",
]

for case in test_cases
  include(case)
end

nothing