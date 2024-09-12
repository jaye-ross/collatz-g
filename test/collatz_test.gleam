import collatz
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn collatz_test() {
  collatz.collatz(5)
  |> should.equal([5, 16, 8, 4, 2, 1])
}
