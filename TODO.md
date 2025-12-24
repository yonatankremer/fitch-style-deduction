## Functional
- implement dynamic or custom asm line length (note: deeply connected to fixing dependence on font size)
- fix dependence on font size and odd constantage
- rethink library structure: proof environment, default parameters + argument flow; make up my mind regarding [lib.typ](lib.typ)
- implement styling; specialize styling for the different elements: text, equations, lines
- custom auto indexation using typst's indexation capabilities; nested indexation for subproofs? that'll be pretty cool! So - implementation of indexation schemes
- rethink indexation entirely
- fix alignment of individual framelines, limit asm-length, or any other length, likely contextually


## QOL
- write the [README](README.md), add comments
- restrict imports
- strengthen input checking
- tidy up; rename
- try to utilize as much stock functions as possible
- try to get rid of the "merge" function


## Naming
- rething utility line naming: start/end or open/close + ass or assume perhaps with some pre/post-fixes
- maybe rename "dynamic" to "auto" and in dynamic let determine manually... although I can easily add manual asm line lengths anyway
- consider general naming schemes