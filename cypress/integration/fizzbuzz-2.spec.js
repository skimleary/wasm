/// <reference types="Cypress" />

// -- Start: Our Application Code --
function fizzbuzz(num) {
  let rslt = ''

  if (num % 3 === 0) {
    rslt = 'fizz'
  }

  if (num % 5 === 0) {
    rslt = rslt + 'buzz'
  }

  else if (rslt === '') {
    rslt = num
  }

  return rslt
}
// -- End: Our Application Code --

// -- Start: Our Cypress Tests --
describe('Unit Test FizzBuzz', () => {
  function numsExpectedToEq(arr, expected) {
    // loop through the array of nums and make
    // sure they equal what is expected
    arr.forEach((num) => {
      expect(fizzbuzz(num)).to.eq(expected)
    })
  }

  it('returns "fizz" when number is multiple of 3', () => {
    numsExpectedToEq([9, 12, 18], 'fizz')
  })

  it('returns "buzz" when number is multiple of 5', () => {
    numsExpectedToEq([10, 20, 25], 'buzz')
  })

  it('returns "fizzbuzz" when number is multiple of both 3 and 5', () => {
    numsExpectedToEq([15, 30, 60], 'fizzbuzz')
  })

  it('returns number when number does not match any criteria above', () => {
    expect(fizzbuzz(1) == 1)
    expect(fizzbuzz(2) == 2)
    expect(fizzbuzz(21) == 21)
    expect(fizzbuzz(99) == 99)
  })
})

