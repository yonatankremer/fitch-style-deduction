// the identity function
#let id = x => x

// merges two equally lengthed arrays into a pair-array of the same length
#let merge(arr1, arr2) = {

  let l1 = arr1.len()
  let l2 = arr2.len()
  assert(arr1.len() == arr2.len(), message: "Arrays must be of the same length")

  let out = ()
  for i in range(arr1.len()) {out.push((arr1.at(i), arr2.at(i)))}
  return out
}