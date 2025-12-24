#import "frame-line.typ": *
#import "formula.typ": * // constrain later
#import "helpers.typ": merge

// returns an array of each formula's array of frame lines
#let frame-as-array(form, frame-line-model) = {

  let frm = ()
  let new = (frame-line-model,)
  let is-asm = (false,)

  for line in form {

    if line == sps {

      if is-asm.last() {
        new.push(fl-modify(frame-line-model, "is-short", true))
        }
        
      else {new.push(frame-line-model)}
      is-asm.push(false)

    }

    else if line == spe {
      
      let _ = new.pop()
      let _ = is-asm.pop()
      
    }

    else if line == asm {
      frm.last().last() = fl-modify(frm.last().last(), "is-asm", true)
      is-asm.last() = true
    }

    // is a visible line
    else {
      frm.push(new)
      new.last() = fl-modify(new.last(), "is-short", false)
    }

  }

  return frm

}

// resizes assumption lines according to the last assumption's display size
#let dynamic-asms(merged) = {

  let new = ()

  for (fml, frm) in merged {

    // fix constantage, independence of appearance, and breaking, with context

    let len = context{measure(fml.equation).width * text.size.pt()}
    frm.last() = fl-modify(frm.last(), "asm-length", len)
    new.push((fml, frm))
  }

  return new

}

#let frame(formulas, frame-line-model, asm-mode) = {
  
  formulas = parse(formulas)
  let arr = frame-as-array(formulas, frame-line-model)
  formulas = formulas.filter(x => x not in utils)

  let merged = merge(formulas, arr)
  if asm-mode == "dynamic" {merged = dynamic-asms(merged)}

  let out = ()

  for (fml, frm) in merged {

    let move-left = 0pt 
    if frm.last().is-asm {move-left = frm.last().asm-length}
    let new-line = stack(
      dir: ltr,
      spacing: 11pt, // fix constant...
      ..(frm.map(x => fl-display(x))),
      align(left+horizon, move(dx: -(move-left + 11pt/1.75), fml.equation)) // fix constant
      )
    out.push(align(left,new-line))

  }

  return stack(
    dir: ttb,
    ..out
  )

}