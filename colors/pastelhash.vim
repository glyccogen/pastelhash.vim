if exists('g:colors_name')
	highlight clear
endif

if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'pastelhash'

let s:variant = get(g:, 'pastelhash_variant', '')
if s:variant !=# 'light' && s:variant !=# 'dark'
	if &background ==# 'light'
		let s:variant = 'light'
	else
		let s:variant = 'dark'
	endif
endif

if s:variant ==# 'light'
	let s:bg      = '#F7F7FF'
	let s:bg_alt  = '#EEEEFC'
	let s:fg      = '#3F3F53'
else
	let s:bg      = '#252530'
	let s:bg_alt  = '#202025'
	let s:fg      = '#BDBDD9'
endif

let s:error    = '#EE5E66'
let s:warning  = '#FABD2F'
let s:ok       = '#79C779'
let s:info     = '#66AFEF'
let s:hint     = '#66B6C6'
let s:comment  = '#7F879E'
let s:literal  = '#88B8FA'
let s:decl     = '#AF87D7'
let s:keyword  = '#CC7000'
let s:immutable = '#AB7F49'

let s:deprecated_as_warn = get(g:, 'pastelhash_deprecated_as_warn', 0)
let s:highlight_immutable = get(g:, 'pastelhash_highlight_immutable', 0)
let s:highlight_keywords = get(g:, 'pastelhash_highlight_keywords', 0)
let s:keyword_fg = s:highlight_keywords ? s:keyword : s:fg

let s:none = 'NONE'

function! s:hi(group, fg, bg, attr) abort
  execute 'highlight' a:group
        \ 'guifg=' . a:fg
        \ 'guibg=' . a:bg
        \ 'gui=' . a:attr
        \ 'cterm=NONE'
        \ 'ctermfg=NONE'
        \ 'ctermbg=NONE'
endfunction

function! s:link(from, to) abort
  execute 'highlight! link' a:from a:to
endfunction

call s:hi('Normal',       s:fg,      s:bg,      'NONE')
call s:hi('NormalNC',     s:fg,      s:bg,      'NONE')
call s:hi('NormalFloat',  s:fg,      s:bg_alt,  'NONE')
call s:hi('FloatBorder',  s:comment, s:bg_alt,  'NONE')
call s:hi('CursorLine',   s:none,    s:bg_alt,  'NONE')
call s:hi('CursorLineNr', s:fg,      s:bg_alt,  'bold')
call s:hi('LineNr',       s:comment, s:none,    'NONE')
call s:hi('SignColumn',   s:none,    s:none,    'NONE')
call s:hi('ColorColumn',  s:none,    s:bg_alt,  'NONE')
call s:hi('Visual',       s:none,    s:bg_alt,  'bold')
call s:hi('Search',       s:bg,      s:hint,    'bold')
call s:hi('IncSearch',    s:bg,      s:warning, 'bold')
call s:hi('MatchParen',   s:hint,    s:bg_alt,  'bold')

call s:hi('Pmenu',        s:fg,      s:bg_alt,  'NONE')
call s:hi('PmenuSel',     s:bg,      s:info,    'bold')
call s:hi('StatusLine',   s:fg,      s:bg_alt,  'NONE')
call s:hi('StatusLineNC', s:comment, s:bg_alt,  'NONE')
call s:hi('VertSplit',    s:bg_alt,  s:none,    'NONE')
call s:hi('WinSeparator', s:bg_alt,  s:none,    'NONE')
call s:hi('TabLine',      s:comment, s:bg_alt,  'NONE')
call s:hi('TabLineFill',  s:comment, s:bg_alt,  'NONE')
call s:hi('TabLineSel',   s:fg,      s:bg,      'bold')
call s:hi('EndOfBuffer',  s:bg,      s:none,    'NONE')
call s:hi('NonText',      s:comment, s:none,    'NONE')
call s:hi('Whitespace',   s:comment, s:none,    'NONE')
call s:hi('Directory',    s:info,    s:none,    'NONE')
call s:hi('Title',        s:decl,    s:none,    'bold')
call s:hi('Question',     s:ok,      s:none,    'bold')
call s:hi('MoreMsg',      s:ok,      s:none,    'NONE')
call s:hi('WarningMsg',   s:warning, s:none,    'NONE')
call s:hi('ErrorMsg',     s:error,   s:none,    'bold')
call s:hi('Conceal',      s:comment, s:none,    'NONE')
call s:hi('Folded',       s:comment, s:bg_alt,  'NONE')
call s:hi('FoldColumn',   s:comment, s:none,    'NONE')
call s:hi('QuickFixLine', s:none,    s:bg_alt,  'bold')
call s:hi('Substitute',   s:bg,      s:warning, 'bold')
call s:hi('SpellBad',     s:error,   s:none,    'undercurl')
call s:hi('SpellCap',     s:info,    s:none,    'undercurl')
call s:hi('SpellRare',    s:hint,    s:none,    'undercurl')
call s:hi('SpellLocal',   s:ok,      s:none,    'undercurl')

call s:hi('Comment',      s:comment, s:none,    'italic')
call s:hi('Constant',     s:literal, s:none,    'NONE')
call s:hi('String',       s:literal, s:none,    'NONE')
call s:hi('Character',    s:literal, s:none,    'NONE')
call s:hi('Number',       s:literal, s:none,    'NONE')
call s:hi('Boolean',      s:literal, s:none,    'NONE')
call s:hi('Float',        s:literal, s:none,    'NONE')
call s:hi('Identifier',   s:fg,      s:none,    'NONE')
if has('nvim')
	call s:hi('Function',   s:fg,      s:none,    'NONE')
else
	call s:hi('Function',   s:decl,    s:none,    'NONE')
endif
call s:hi('Statement',    s:keyword_fg, s:none,    'NONE')
call s:hi('Conditional',  s:keyword_fg, s:none,    'NONE')
call s:hi('Repeat',       s:keyword_fg, s:none,    'NONE')
call s:hi('Label',        s:fg,      s:none,    'NONE')
call s:hi('Operator',     s:fg,      s:none,    'NONE')
call s:hi('Keyword',      s:keyword_fg, s:none,    'NONE')
call s:hi('Exception',    s:keyword_fg, s:none,    'NONE')
call s:hi('PreProc',      s:decl,    s:none,    'NONE')
call s:hi('Include',      s:decl,    s:none,    'NONE')
call s:hi('Type',         s:fg,      s:none,    'NONE')
call s:hi('StorageClass', s:fg,      s:none,    'NONE')
call s:hi('Structure',    s:fg,      s:none,    'NONE')
call s:hi('Typedef',      s:fg,      s:none,    'NONE')
call s:hi('Special',      s:info,    s:none,    'NONE')
call s:hi('Delimiter',    s:fg,      s:none,    'NONE')
call s:hi('Underlined',   s:hint,    s:none,    'underline')
call s:hi('Error',        s:error,   s:none,    'bold')
call s:hi('Todo',         s:warning, s:none,    'bold')
if s:deprecated_as_warn
	call s:hi('Deprecated', s:warning, s:none, 'strikethrough')
else
	call s:hi('Deprecated', s:comment, s:none, 'strikethrough')
endif
if s:highlight_immutable
	call s:hi('ReadOnly', s:immutable, s:none, 'NONE')
else
	call s:hi('ReadOnly', s:fg, s:none, 'NONE')
endif

call s:hi('DiagnosticError', s:error,   s:none, 'NONE')
call s:hi('DiagnosticWarn',  s:warning, s:none, 'NONE')
call s:hi('DiagnosticInfo',  s:info,    s:none, 'NONE')
call s:hi('DiagnosticHint',  s:hint,    s:none, 'NONE')
call s:hi('DiagnosticOk',    s:ok,      s:none, 'NONE')
call s:hi('DiagnosticUnderlineError', s:error,   s:none, 'undercurl')
call s:hi('DiagnosticUnderlineWarn',  s:warning, s:none, 'undercurl')
call s:hi('DiagnosticUnderlineInfo',  s:info,    s:none, 'undercurl')
call s:hi('DiagnosticUnderlineHint',  s:hint,    s:none, 'undercurl')
call s:hi('DiagnosticVirtualTextError', s:error,   s:bg_alt, 'NONE')
call s:hi('DiagnosticVirtualTextWarn',  s:warning, s:bg_alt, 'NONE')
call s:hi('DiagnosticVirtualTextInfo',  s:info,    s:bg_alt, 'NONE')
call s:hi('DiagnosticVirtualTextHint',  s:hint,    s:bg_alt, 'NONE')
call s:hi('DiagnosticFloatingError',    s:error,   s:bg_alt, 'NONE')
call s:hi('DiagnosticFloatingWarn',     s:warning, s:bg_alt, 'NONE')
call s:hi('DiagnosticFloatingInfo',     s:info,    s:bg_alt, 'NONE')
call s:hi('DiagnosticFloatingHint',     s:hint,    s:bg_alt, 'NONE')
call s:hi('LspReferenceText',  s:none, s:bg_alt, 'bold')
call s:hi('LspReferenceRead',  s:none, s:bg_alt, 'bold')
call s:hi('LspReferenceWrite', s:none, s:bg_alt, 'bold')

call s:hi('DiffAdd',    s:ok,      s:bg_alt, 'NONE')
call s:hi('DiffChange', s:warning, s:bg_alt, 'NONE')
call s:hi('DiffDelete', s:error,   s:bg_alt, 'NONE')
call s:hi('DiffText',   s:info,    s:bg_alt, 'bold')

if has('nvim')
	call s:link('@none',                 'Normal')
	call s:link('@comment',              'Comment')
	call s:link('@comment.documentation','Comment')
	call s:link('@string',               'String')
	call s:link('@string.escape',        'Special')
	call s:link('@string.regex',         'Special')
	call s:link('@string.special',       'Special')
	call s:link('@character',            'Character')
	call s:link('@character.special',    'Special')
	call s:link('@number',               'Number')
	call s:link('@number.float',         'Float')
	call s:link('@boolean',              'Boolean')
	call s:link('@constant',             'Constant')
	call s:link('@constant.builtin',     'Constant')
	call s:link('@constant.macro',       'Constant')
	call s:link('@keyword.operator',     'Operator')
	call s:link('@keyword.return',       'Keyword')
	call s:link('@keyword.repeat',       'Repeat')
	call s:link('@keyword.conditional',  'Conditional')
	call s:link('@keyword.exception',    'Exception')
	call s:link('@operator',             'Operator')
	call s:link('@punctuation',          'Delimiter')
	call s:link('@punctuation.delimiter','Delimiter')
	call s:link('@punctuation.bracket',  'Delimiter')
	call s:link('@punctuation.special',  'Special')
	call s:link('@type.builtin',         'Type')
	call s:link('@attribute',            'PreProc')
	call s:link('@property',             'Identifier')
	call s:link('@deprecated',           'Deprecated')
	call s:link('@tag',                  'Keyword')
	call s:link('@tag.attribute',        'Identifier')
	call s:link('@tag.delimiter',        'Delimiter')

	call s:hi('@function',             s:fg,      s:none, 'NONE')
	call s:hi('@function.builtin',     s:fg,      s:none, 'NONE')
	call s:hi('@function.macro',       s:fg,      s:none, 'NONE')
	call s:hi('@function.method',      s:fg,      s:none, 'NONE')
	call s:hi('@function.call',        s:fg,      s:none, 'NONE')
	call s:hi('@function.method.call', s:fg,      s:none, 'NONE')
	call s:hi('@constructor',          s:fg,      s:none, 'NONE')
	call s:hi('@type',                 s:fg,      s:none, 'NONE')
	call s:hi('@type.definition',      s:decl,    s:none, 'NONE')
	call s:hi('@keyword',              s:keyword_fg, s:none, 'NONE')
	call s:hi('@keyword.function',     s:keyword_fg, s:none, 'NONE')
	call s:hi('@keyword.type',         s:keyword_fg, s:none, 'NONE')
	call s:hi('@keyword.modifier',     s:keyword_fg, s:none, 'NONE')
	call s:hi('@keyword.storage',      s:keyword_fg, s:none, 'NONE')
	call s:hi('@keyword.import',       s:decl,    s:none, 'NONE')
	call s:hi('@include',              s:decl,    s:none, 'NONE')
	call s:hi('@module',               s:decl,    s:none, 'NONE')
	call s:hi('@namespace',            s:fg,      s:none, 'NONE')
	call s:hi('@variable',             s:fg,      s:none, 'NONE')
	call s:hi('@variable.parameter',   s:fg,      s:none, 'NONE')
	call s:hi('@variable.member',      s:fg,      s:none, 'NONE')
	call s:hi('@type.qualifier',       s:fg,      s:none, 'NONE')
	call s:hi('@function.definition',  s:decl,    s:none, 'NONE')
	call s:hi('@function.declaration', s:decl,    s:none, 'NONE')
	call s:hi('@lsp.typemod.function.declaration', s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.function.definition',  s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.method.declaration',   s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.method.definition',    s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.variable.declaration', s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.variable.definition',  s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.parameter.declaration', s:fg,   s:none, 'NONE')
	call s:hi('@lsp.typemod.parameter.definition',  s:fg,   s:none, 'NONE')
	call s:hi('@lsp.typemod.class.declaration',    s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.struct.declaration',   s:decl, s:none, 'NONE')
	call s:hi('@lsp.typemod.type.declaration',     s:decl, s:none, 'NONE')
	call s:hi('@lsp.mod.declaration',              s:decl, s:none, 'NONE')
	call s:hi('@lsp.mod.definition',               s:decl, s:none, 'NONE')
	call s:link('@lsp.mod.deprecated',             'Deprecated')
	call s:link('@lsp.typemod.variable.deprecated','Deprecated')
	call s:link('@lsp.typemod.function.deprecated','Deprecated')
	call s:link('@lsp.typemod.method.deprecated',  'Deprecated')
	call s:link('@lsp.typemod.property.deprecated','Deprecated')
	call s:link('@lsp.mod.readonly',               'ReadOnly')
	call s:link('@lsp.typemod.variable.readonly',  'ReadOnly')
	call s:link('@lsp.typemod.parameter.readonly', 'ReadOnly')
	call s:link('@lsp.typemod.property.readonly',  'ReadOnly')
	call s:link('@lsp.type.comment',            'Comment')
	call s:link('@lsp.type.class',              'Type')
	call s:link('@lsp.type.enum',               'Type')
	call s:link('@lsp.type.enumMember',         'Constant')
	call s:link('@lsp.type.function',           'Function')
	call s:link('@lsp.type.keyword',            'Keyword')
	call s:link('@lsp.type.macro',              'PreProc')
	call s:link('@lsp.type.method',             'Function')
	call s:link('@lsp.type.namespace',          'Identifier')
	call s:link('@lsp.type.number',             'Number')
	call s:link('@lsp.type.operator',           'Operator')
	call s:link('@lsp.type.parameter',          'Identifier')
	call s:link('@lsp.type.property',           'Identifier')
	call s:link('@lsp.type.string',             'String')
	call s:link('@lsp.type.struct',             'Structure')
	call s:link('@lsp.type.type',               'Type')
	call s:link('@lsp.type.typeParameter',      'Type')
	call s:link('@lsp.type.variable',           'Identifier')
endif

if has('nvim')
	lua pcall(function() require('pastelhash.gitsigns').apply() end)
endif

unlet s:variant s:bg s:bg_alt s:fg s:error s:warning s:ok s:info s:hint s:comment s:literal s:decl s:keyword s:immutable s:none s:deprecated_as_warn s:highlight_immutable s:highlight_keywords s:keyword_fg
delfunction s:hi
delfunction s:link
