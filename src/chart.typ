#import "formula.typ": *
#import "frame.typ": *
#import "frame-line.typ": *

#let indices(fms, height) = {
  
    let font-size = 11pt // fix... constantage
    // let s = em(context text.size)

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, text(size: 11pt, it.index))) // fix larger text
    )
}

#let rules(fms, height) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, $it.rule$))
    )
}


// asm-mode is either a relative length or "dynamic"; could maybe add some interpolation closure option sometime

#let chart(row-height: 3em, asm-mode, fms) = {

  assert(asm-mode == "dynamic" or type(asm-mode) == length, message: "Invalid asm-mode! Can only be \"dynamic\" of a relative length.")

  let asm-length = asm-mode
  if asm-mode == "dynamic" {asm-length = frame-line().asm-length}

  let parsed = parse(fms).filter(x => x not in utils)

  stack(
    dir: ltr,
    spacing: 11pt, // again, fix (solve, funny) constantage
    indices(parsed, row-height),
    frame(fms, frame-line(length: row-height, asm-length: asm-length), asm-mode), // improve customization
    rules(parsed, row-height)
  )
}

