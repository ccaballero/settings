" jacobian theme based on distiguished

" Initialization {{{
    let g:colors_name = 'jacobian'

    highlight clear
    set background=dark
    set linespace=2

    if exists('syntax_on')
        syntax reset
    endif

    if v:version > 700
        set cursorline
        set cursorcolumn
    endif

    if &t_Co != 256 || has('gui_running')
        echoe 'The ' . g:colors_name . ' color scheme requires a 256-color'
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
    \ , 'Visual'                     : [ 'none',    237,           'none']
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
    \ , 'Search'                     : [     93,    152,           'bold']
    \ , 'IncSearch'                  : [     18,    113,           'none']
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
    \ , 'Comment'                    : [    243,    233,           'none']
    \
    \ , 'Constant'                   : [    137, 'none',           'bold']
    \ , 'String'                     : [    227, 'none',           'none']
    \ , 'Character'                  : [     66, 'none',           'bold']
    \ , 'Number'                     : [    173, 'none',           'none']
    \ , 'Boolean'                    : [     66, 'none',           'bold']
    \ , 'Float'                      : [     66, 'none',           'bold']
    \
    \ , 'Identifier'                 : [     66, 'none',           'bold']
    \ , 'Function'                   : [    221, 'none',           'none']
    \
    \ , 'Statement'                  : [    186, 'none',           'bold']
    \ , 'Conditional'                : [    186, 'none',           'bold']
    \ , 'Repeat'                     : [    186, 'none',           'bold']
    \ , 'Label'                      : [    186, 'none',           'bold']
    \ , 'Operator'                   : [    215, 'none',           'none']
    \ , 'Keyword'                    : [    173, 'none',           'none']
    \ , 'Exception'                  : [    186, 'none',           'bold']
    \
    \ , 'PreProc'                    : [    144, 'none',           'none']
    \ , 'Include'                    : [    173, 'none',           'none']
    \ , 'Define'                     : [    173, 'none',           'none']
    \ , 'Macro'                      : [    186, 'none',           'bold']
    \ , 'PreCondit'                  : [    173, 'none',           'none']
    \
    \ , 'Type'                       : [     67, 'none',           'bold']
    \ , 'StorageClass'               : [    180, 'none',           'none']
    \ , 'Structure'                  : [    139, 'none',           'none']
    \ , 'TypeDef'                    : [    186, 'none',           'bold']
    \
    \ , 'Special'                    : [    150, 'none',           'none']
    \ , 'SpecialChar'                : [    150, 'none',           'none']
    \ , 'Tag'                        : [     15, 'none',           'none']
    \ , 'Delimiter'                  : [    145, 'none',           'none']
    \ , 'SpecialComment'             : [    145, 'none',           'none']
    \ , 'Debug'                      : [    145, 'none',           'none']
    \
    \ , 'Underlined'                 : [     15, 'none',           'none']
    \ , 'Ignore'                     : [     59, 'none',           'none']
    \ , 'Error'                      : [    208,    124,           'none']
    \ , 'Todo'                       : [    228,     94,           'bold']
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
hi link PHPCommentTitle    Comment
hi link PHPDocTags         Comment
hi link PHPDocParam        Comment
hi link PHPEOL             Constant
hi link PHPStringDelim     Delimiter
hi link PHPDelimiter       Delimiter
hi link PHPFunctions       Function
hi link PHPBoolean         Boolean
hi link PHPOperator        Operator
hi link PHPMemberSelector  Keyword
hi link PHPParent          Label
hi link PHPClassTag        Tag
hi link PHPInterfaceTag    Tag
hi link PHPFunctionTag     Tag

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

