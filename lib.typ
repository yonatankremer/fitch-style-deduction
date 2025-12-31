#import "src/chart.typ": chart
#import "src/formula.typ": sps, spe, asm
#import "src/frameline.typ": frameline

#let ded(frameline: frameline(), asm-mode: "manual", formulas) = {
  
  assert(asm-mode in ("manual", "dynamic"),
  message: "Invalid asm-mode! Can only be \"manual\" or \"dynamic\"."
  )

  chart(frameline, asm-mode, formulas)
}