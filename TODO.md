Note about `context`: use only when returning content - content is unmodifiable!

## Critical
- figure out structure for index and rule alignment!
    - got it half-fixed. Essentially, it must be divided to 3 columns of content, as the alignment it "kind" (index, frame, rule) dependent, and not row dependent. The rule column refuses to cooperate.

## Functional
- fix dependence on font size and odd constantage
- rethink library structure:
    - a proof environment
    - ~~default parameters + argument flow~~ no default parameters or input verification beyond [lib.typ](lib.typ) (suppose it is always valid)
        - note: [frameline.typ](src/frameline.typ) or a user-oriented version of it as an exception.
- implement styling; specialize styling for the different elements: text, equations, lines
- custom auto indexation using typst's indexation capabilities; nested indexation for subproofs? that'll be pretty cool! So - implementation of indexation schemes
- rethink indexation entirely
- add the option to manually set asm-lines. can either "obey" to dynamic, ignore it, or be settable.
- change as many relative lengths to alignments as possible ([chart.typ](src/chart.typ))
- asm-mode is either a relative length or "dynamic"; could maybe add some "curved length" sometime (just a composition of the measure part with some function of a domain... idk, range of the interval \(0,1\])

## QOL
- write the [README](README.md), add comments
- restrict imports
- strengthen input checking
- try to utilize as much built-in functions as possible
- try to get rid of the "merge" function

## Naming
- rething utility line naming: start/end or open/close + ass or assume perhaps with some pre/post-fixes s