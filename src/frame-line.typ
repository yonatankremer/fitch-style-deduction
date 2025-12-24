//type definition
#let frame-line(length: 3em, thick: .5pt, stroke: black, is-short: false, is-asm: false, asm-length: 25pt, asm-thick: .5pt, asm-stroke: black) = {
  (
    length: length,
    thick: thick,
    stroke: stroke,
    is-short: is-short,
    is-asm: is-asm,
    asm-length: asm-length,
    asm-thick: asm-thick,
    asm-stroke: asm-stroke
  )
}

#let fl-modify(fl, key, value) = {

  assert(key in fl.keys(), message: "Property DNE!")

  let out = fl
  out.insert(key, value)
  return out
}

#let fl-display(fl) = {

  if fl.is-short {fl.length -= 10*fl.thick}
      let ln = line(angle: 90deg, length: fl.length, stroke: fl.thick + fl.stroke)

      // context if fl.is-asm { return align(
      if fl.is-asm { return align(
          bottom, stack(dir: ttb, ln,
          move(
            dx: fl.thick/2,
            dy: -fl.asm-thick/2, align(right+bottom,line(length: fl.asm-length, stroke: fl.asm-thick))
        )))
      }

    else {return ln}
}