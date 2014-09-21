" jacobian theme based on distiguished

" Initialization {{{
    let g:colors_name = 'jacobian'

    "highlight clear
    "set background=dark
    "set linespace=2

    if exists('syntax_on')
        syntax reset
    endif

    if v:version > 700
        set cursorline
        set cursorcolumn
    endif

    if &t_Co != 256 || has('gui_running')
        "echoe 'The ' . g:colors_name . ' color scheme requires a 256-color'
        finish
    endif
" }}}

" Color dictionary parser {{{
    function! s:ColorDictParser(color_dict)
        for [group, group_colors] in items(a:color_dict)
            exec 'hi ' . group
            \ . ' ctermfg=' . group_colors[0]
            \ . ' ctermbg=' . group_colors[1]
            \ . '   cterm=' . group_colors[2]
        endfor
    endfunction
" }}}

"     | Highlight group                |    FG |    BG |      Attributes |
"     |--------------------------------|-------|-------|-----------------|
call s:ColorDictParser({
    \   'Normal'                     : [    252, 'none',           'none']
    \ , 'Visual'                     : [ 'none',    237,        'reverse']
    \
    \ , 'CursorLine'                 : [ 'none',    233,           'none']
    \ , 'CursorColumn'               : [ 'none',    233,           'none']
    \ , 'ColorColumn'                : [ 'none',    235,           'none']
    \
    \ , 'LineNr'                     : [    243,    235,           'none']
    \ , 'VertSplit'                  : [    235,    243,           'none']
    \
    \ , 'Directory'                  : [    132, 'none',           'bold']
    \
    \ , 'Title'                      : [    190, 'none',           'none']
    \ , 'Question'                   : [    154, 'none',           'bold']
    \ , 'ModeMsg'                    : [    154, 'none',           'bold']
    \ , 'MoreMsg'                    : [    154, 'none',           'bold']
    \ , 'WarningMsg'                 : [    202, 'none',           'bold']
    \ , 'ErrorMsg'                   : [    196, 'none',           'bold']
    \
    \ , 'SpecialKey'                 : [    239, 'none',           'none']
    \ , 'NonText'                    : [    236, 'none',           'none']
    \ , 'MatchParen'                 : [     17,      2,           'bold']
    \
    \ , 'Search'                     : [ 'none', 'none',   'reverse,bold']
    \ , 'IncSearch'                  : [ 'none', 'none',   'reverse,bold']
    \
    \ , 'TabLine'                    : [    250,     17,           'none']
    \ , 'TabLineSel'                 : [    250,     27,           'bold']
    \ , 'TabLineFill'                : [    250,     17,           'none']
    \
    \ , 'Pmenu'                      : [    248,    240,           'none']
    \ , 'PmenuSel'                   : [    253,    245,           'none']
    \ , 'PmenuSbar'                  : [    253,    248,           'none']
    \ , 'PmenuThumb'                 : [    243,    230,           'none']
    \
    \ , 'SpellBad'                   : [    145,      1,           'none']
    \ , 'SpellCap'                   : [    145,      4,           'none']
    \ , 'SpellRare'                  : [    145,      4,           'none']
    \ , 'SpellLocal'                 : [    145,      4,           'none']
    \
    \ , 'Comment'                    : [ 'none',    236,           'none']
    \
    \ , 'Constant'                   : [    189,  'none',          'none']
    \ , 'String'                     : [    190,  'none',          'none']
    \ , 'Character'                  : [    191,  'none',          'none']
    \ , 'Number'                     : [    192,  'none',          'none']
    \ , 'Boolean'                    : [    193,  'none',          'none']
    \ , 'Float'                      : [    194,  'none',          'none']
    \
    \ , 'Identifier'                 : [    172,  'none',          'none']
    \ , 'Function'                   : [    174,  'none',          'none']
    \
    \ , 'Statement'                  : [     77,  'none',          'none']
    \ , 'Conditional'                : [    134,  'none',          'none']
    \ , 'Repeat'                     : [    135,  'none',          'none']
    \ , 'Label'                      : [ 'none',  'none',          'bold']
    \ , 'Operator'                   : [     39,  'none',          'none']
    \ , 'Keyword'                    : [    147,  'none',          'none']
    \ , 'Exception'                  : [ 'none',  'none',          'none']
    \
    \ , 'PreProc'                    : [    86,   'none',          'none']
    \ , 'Include'                    : [    82,   'none',          'none']
    \ , 'Define'                     : [    84,   'none',          'none']
    \ , 'Macro'                      : [    87,   'none',          'none']
    \ , 'PreCondit'                  : [    93,   'none',          'none']
    \
    \ , 'Type'                       : [    75,   'none',          'none']
    \ , 'StorageClass'               : [   201,   'none',          'none']
    \ , 'Structure'                  : [   200,   'none',          'none']
    \ , 'TypeDef'                    : [ 'none',       5,          'none']
    \
    \ , 'Special'                    : [    49,   'none',          'none']
    \ , 'SpecialChar'                : [    50,   'none',          'none']
    \ , 'Tag'                        : [   105,   'none',          'none']
    \ , 'Delimiter'                  : [   198,   'none',          'none']
    \ , 'SpecialComment'             : [ 'none',      5,           'none']
    \ , 'Debug'                      : [ 'none',      5,           'none']
    \
    \ , 'Underlined'                 : [ 'none',      5,           'none']
    \ , 'Ignore'                     : [ 'none',      5,           'none']
    \ , 'Error'                      : [ 'none',      5,           'none']
    \ , 'Todo'                       : [ 'none',      5,           'none']
\ })

" XML
hi link XMLTag             Tag
hi link XMLTagName         Tag
hi link XMLEndTag          Tag

" HTML
hi link HTMLTag            XMLTag
hi link HTMLTagName        XMLTagName
hi link HTMLEndTag         XMLEndTag
hi link HTMLArg            Function
hi link HTMLLink           Identifier
hi link HTMLTitle          Title

" PHP
hi link PHPCommentTitle    Normal
hi link PHPDocTags         Normal
hi link PHPDocParam        Normal
hi link PHPEOL             Normal
hi link PHPStringDelim     Normal
hi link PHPDelimiter       Normal
hi link PHPFunctions       Normal
hi link PHPBoolean         Normal
hi link PHPOperator        Normal
hi link PHPMemberSelector  Normal
hi link PHPParent          Normal
hi link PHPClassTag        Normal
hi link PHPInterfaceTag    Normal
hi link PHPFunctionTag     Normal

" Diff
hi link DiffAdd            Comment
hi link DiffChange         Comment
hi link DiffDelete         Comment
hi link DiffText           Comment
hi link DiffLine           Comment
hi link DiffFile           Comment
hi link DiffNewFile        Comment
hi link DiffAdded          DiffAdd
hi link DiffChanged        DiffChange
hi link DiffRemoved        DiffDelete

" PYTHON
hi link PythonFunction     Method

" Javascript
hi link JavaScriptFunction          Keyword
hi link JavaScriptNumber            Number
hi link JavascriptMember            Method
hi link JavascriptBraces            Normal
hi link JavascriptNull              Method

" CSS
hi link CSSImportant                Identifier
hi link CSSBraces                   Normal

