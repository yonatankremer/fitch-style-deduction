#import "frameline.typ": *
#import "formula.typ": * // constrain later

// returns an array of each formula's array of frame lines; core logic of the library.
#let frame-as-array(formulas, fl-model) = {

  let frm = ()
  let new = (fl-model,)
  let is-asm = (false,)

  for line in formulas {

    if line == sps {

      if is-asm.last() {
        let push = fl-model
        push.insert("is-short", true)
        new.push(push)
        }
        
      else {new.push(fl-model)}
      is-asm.push(false)

    }

    else if line == spe {
      
      let _ = new.pop()
      let _ = is-asm.pop()
      
    }

    else if line == asm {
      frm.last().last().insert("is-asm", true)
      is-asm.last() = true
    }

    // is a visible line
    else {
      frm.push(new)
      new.last().insert("is-short", false)
    }

  }

  return frm

}

#let frame(fl-model, asm-mode, formulas) = context {

  let arr = frame-as-array(formulas, fl-model)
  let formulas = formulas.filter(x => x not in utils)
  let merged = array.zip(arr, formulas)

  if asm-mode == "dynamic" {
    for i in range(merged.len()) {
      merged.at(i).at(0).last().insert("asm-length", measure(merged.at(i).at(1).equation).width + 1em) // cursed
    }
  } // LFGGGGG

  // What was the problem? Easy - I ran a for (x,y) in merged and modified x - but it doesn't refer to the value that is x in merged!! It has to be directly, sadly through indexation.

  // Another two possible implementations: 
  //  - throwing the same line in the same conditional in the loop below
  //  - defining is-dynamic = 1 if dynamic, 0 if manual, then in each iteration of the loop set the current fl-row.last... to is-dynamic * mesaure... + 1-is-dynamic * fl-model asmlength... quite ugly, and will require the loop the use 

  // oddly enough, using merged.map(...) doesn't work!
  

  let out = ()

  for (fl-row, formula) in merged {

    let move-left = 0em
    if fl-row.last().is-asm {move-left = fl-row.last().asm-length}
    let new-line = stack(
      dir: ltr,
      spacing: 1em,
      ..fl-row.map(x => align(bottom+left, fl-display(x))),
      align(left+horizon, move(dx: -(move-left + .5em), formula.equation))
      )
    out.push(align(left,new-line))

  }

  return stack(
    dir: ttb,
    ..out
  )

}