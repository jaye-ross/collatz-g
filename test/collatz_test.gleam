import collatz
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn next_value_test() {
  collatz.next_value(5)
  |> should.equal(16)
}
