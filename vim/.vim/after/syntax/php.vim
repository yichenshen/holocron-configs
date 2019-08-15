" Hack built-ins
syn keyword phpType vec dict keyset contained nextgroup=hackGenericSpec
syn keyword phpType varray darray contained nextgroup=hackGenericSpec
syn keyword phpType Awaitable contained nextgroup=hackGenericSpec
syn keyword phpClasses Vector Map Set contained nextgroup=hackGenericSpec

" Hack keywords
syn keyword phpException catch throw try finally contained
syn keyword phpStorageClass global static contained
syn keyword phpIdentifier final contained
syn keyword phpConstants private protected public abstract contained
syn keyword phpKeyword const contained

" Hack functions
syn keyword phpFunctions nullthrows invariant contained
syn keyword phpFunctions hphpd_break contained

" Hack libraries
syn keyword phpConstants C Vec Str Dict Regex Keyset Tuple contained
syn keyword phpConstants PseudoRandom SecureRandom Math contained

" Hack operators
syn keyword phpOperator is contained
syn keyword phpOperator << contained
syn keyword phpOperator >> contained

" For hack generics contraints
syn clear hackGenericType

syn match hackTypeConstraint +=+ contained
syn keyword hackTypeConstraint super contained
syn keyword hackTypeConstraint as contained

syn region hackGenericSpec start="<" end=">" contained
      \ contains=phpKeyword,phpType,phpClasses,phpInterfaces,hackTypeConstraint,hackGenericSpec
syn region hackImplementsGeneric start="<" end=">" contained
      \ contains=phpKeyword,phpType,phpClasses,phpInterfaces,hackTypeConstraint,hackImplementsGeneric
      \ nextgroup=phpClassDelimiter skipwhite skipempty
syn region hackUseClassGeneric start="<" end=">" contained
      \ contains=phpKeyword,phpType,phpClasses,phpInterfaces,hackTypeConstraint,hackUseClassGeneric
      \ nextgroup=phpUseAlias skipwhite skipempty

syn match phpFunction /\h\w*/ contained nextgroup=hackGenericSpec
syn match phpClass /\h\w*/ contained nextgroup=hackGenericSpec
syn match phpClassExtends /\h\w*/ contained nextgroup=hackGenericSpec
syn match phpClassImplements contained contains=phpClassNamespaceSeparator
      \ nextgroup=phpClassDelimiter,hackImplementsGeneric skipwhite skipempty /\(\\\|\h\w*\)*\h\w*/
syn match phpUseClass /\(function\_s\+\)\@!\(\\\|\h\w*\)*\h\w*/ contained contains=phpUseNamespaceSeparator
      \ nextgroup=hackUseClassGeneric,phpUseAlias skipwhite skipempty
syn match hackGenericAnnotation +@*\s*?*\w\+<.*>+hs=s+2 contained
      \ contains=phpOperator,phpType,phpConstants,phpClasses,phpInterfaces,hackGenericSpec

syn cluster phpClConst add=hackGenericAnnotation

hi def link hackGenericSpec Type
hi def link hackImplementsGeneric Type
hi def link hackUseClassGeneric Type
hi def link hackTypeConstraint Operator

" Hack annotations
syn region hackAnnotation contained
      \ matchgroup=phpOperator start=+^\s*<<+ end=+>>\s*$+
      \ contains=phpStringSingle,phpStringDouble,phpParent
syn region hackLongString contained
      \ matchgroup=hackEOF start=+<<<EOF+ end=+EOF+
syn cluster phpClFunction add=hackAnnotation
syn cluster phpClConst add=hackLongString
hi def link hackAnnotation Special
hi def link hackLongString String
hi def link hackEOF cSpecial
