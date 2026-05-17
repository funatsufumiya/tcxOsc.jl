test_cases = [
  "osc_test.jl",
]

for case in test_cases
  include(case)
end

nothing