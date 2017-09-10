" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Sergey V. Beduev <shaman@interdon.net>
" Last Change: Sun Mar 28 11:19:38 EEST 2004

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "colorer"

" 0 #000000  1 #800000  2 #008000  3 #808000  4 #000080  5 #800080  6 #008080  7 #c0c0c0
" 8 #808080  9 #ff0000 10 #00ff00 11 #ffff00 12 #0000ff 13 #ff00ff 14 #00ffff 15 #ffffff

" 16 #000000  17 #00005f  18 #000087  19 #0000af  20 #0000d7  21 #0000ff
" 22 #005f00  23 #005f5f  24 #005f87  25 #005faf  26 #005fd7  27 #005fff
" 28 #008700  29 #00875f  30 #008787  31 #0087af  32 #0087d7  33 #0087ff
" 34 #00af00  35 #00af5f  36 #00af87  37 #00afaf  38 #00afd7  39 #00afff
" 40 #00d700  41 #00d75f  42 #00d787  43 #00d7af  44 #00d7d7  45 #00d7ff
" 46 #00ff00  47 #00ff5f  48 #00ff87  49 #00ffaf  50 #00ffd7  51 #00ffff
" 52 #5f0000  53 #5f005f  54 #5f0087  55 #5f00af  56 #5f00d7  57 #5f00ff
" 58 #5f5f00  59 #5f5f5f  60 #5f5f87  61 #5f5faf  62 #5f5fd7  63 #5f5fff
" 64 #5f8700  65 #5f875f  66 #5f8787  67 #5f87af  68 #5f87d7  69 #5f87ff
" 70 #5faf00  71 #5faf5f  72 #5faf87  73 #5fafaf  74 #5fafd7  75 #5fafff
" 76 #5fd700  77 #5fd75f  78 #5fd787  79 #5fd7af  80 #5fd7d7  81 #5fd7ff
" 82 #5fff00  83 #5fff5f  84 #5fff87  85 #5fffaf  86 #5fffd7  87 #5fffff
" 88 #870000  89 #87005f  90 #870087  91 #8700af  92 #8700d7  93 #8700ff
" 94 #875f00  95 #875f5f  96 #875f87  97 #875faf  98 #875fd7  99 #875fff
" 100 #878700 101 #87875f 102 #878787 103 #8787af 104 #8787d7 105 #8787ff
" 106 #87af00 107 #87af5f 108 #87af87 109 #87afaf 110 #87afd7 111 #87afff
" 112 #87d700 113 #87d75f 114 #87d787 115 #87d7af 116 #87d7d7 117 #87d7ff
" 118 #87ff00 119 #87ff5f 120 #87ff87 121 #87ffaf 122 #87ffd7 123 #87ffff
" 124 #af0000 125 #af005f 126 #af0087 127 #af00af 128 #af00d7 129 #af00ff
" 130 #af5f00 131 #af5f5f 132 #af5f87 133 #af5faf 134 #af5fd7 135 #af5fff
" 136 #af8700 137 #af875f 138 #af8787 139 #af87af 140 #af87d7 141 #af87ff
" 142 #afaf00 143 #afaf5f 144 #afaf87 145 #afafaf 146 #afafd7 147 #afafff
" 148 #afd700 149 #afd75f 150 #afd787 151 #afd7af 152 #afd7d7 153 #afd7ff
" 154 #afff00 155 #afff5f 156 #afff87 157 #afffaf 158 #afffd7 159 #afffff
" 160 #d70000 161 #d7005f 162 #d70087 163 #d700af 164 #d700d7 165 #d700ff
" 166 #d75f00 167 #d75f5f 168 #d75f87 169 #d75faf 170 #d75fd7 171 #d75fff
" 172 #d78700 173 #d7875f 174 #d78787 175 #d787af 176 #d787d7 177 #d787ff
" 178 #d7af00 179 #d7af5f 180 #d7af87 181 #d7afaf 182 #d7afd7 183 #d7afff
" 184 #d7d700 185 #d7d75f 186 #d7d787 187 #d7d7af 188 #d7d7d7 189 #d7d7ff
" 190 #d7ff00 191 #d7ff5f 192 #d7ff87 193 #d7ffaf 194 #d7ffd7 195 #d7ffff
" 196 #ff0000 197 #ff005f 198 #ff0087 199 #ff00af 200 #ff00d7 201 #ff00ff
" 202 #ff5f00 203 #ff5f5f 204 #ff5f87 205 #ff5faf 206 #ff5fd7 207 #ff5fff
" 208 #ff8700 209 #ff875f 210 #ff8787 211 #ff87af 212 #ff87d7 213 #ff87ff
" 214 #ffaf00 215 #ffaf5f 216 #ffaf87 217 #ffafaf 218 #ffafd7 219 #ffafff
" 220 #ffd700 221 #ffd75f 222 #ffd787 223 #ffd7af 224 #ffd7d7 225 #ffd7ff
" 226 #ffff00 227 #ffff5f 228 #ffff87 229 #ffffaf 230 #ffffd7 231 #ffffff
" 232 #080808 233 #121212 234 #1c1c1c 235 #262626 236 #303030 237 #3a3a3a
" 238 #444444 239 #4e4e4e 240 #585858 241 #606060 242 #666666 243 #767676
" 244 #808080 245 #8a8a8a 246 #949494 247 #9e9e9e 248 #a8a8a8 249 #b2b2b2
" 250 #bcbcbc 251 #c6c6c6 252 #d0d0d0 253 #dadada 254 #e4e4e4 255 #eeeeee

hi Normal	        ctermfg=Gray      ctermbg=Black  guifg=DarkGray  guibg=black
hi Visual	        ctermfg=DarkCyan  ctermbg=NONE   guifg=DarkCyan  guibg=NONE
" mid ligth blue
hi Comment	        ctermfg=32        ctermbg=NONE   guifg=#0087d7

hi PreProc	        ctermfg=Magenta                     guifg=Green
hi PreProcBold	    cterm=bold ctermfg=Magenta gui=bold guifg=Green
hi link Include		PreProcBold
hi link PreCondit	PreProcBold
hi link Macro		PreProc
hi link Define	    PreProc

" dark green
hi Type		                   ctermfg=28             guifg=#008700
hi StorageClass		cterm=bold ctermfg=82    gui=bold guifg=#5FFF00
hi Structure	  	cterm=bold ctermfg=3    gui=bold guifg=#808000
hi link Typedef	    	Type

hi Number	        ctermfg=202  guifg=#FF5F00 gui=NONE
hi link Float		Number

hi Operator	                 ctermfg=White           guifg=White

hi Character	               ctermfg=Yellow          guifg=Yellow	
hi SpecialChar	             ctermfg=Yellow          guifg=Yellow	
hi String                    ctermfg=Red             guifg=Red

hi Boolean	      cterm=bold ctermfg=Red    gui=bold guifg=Red

hi GeneralKeyword cterm=bold ctermfg=White  gui=bold guifg=White 


hi Repeat	        cterm=bold ctermfg=White  gui=bold guifg=White 
hi link Conditional	GeneralKeyword
hi link Label	      GeneralKeyword
hi link Keyword	    GeneralKeyword
hi link Exception	  GeneralKeyword



hi Todo		        term=standout ctermfg=Black ctermbg=Yellow  guifg=Black guibg=Yellow

hi Error	        term=reverse ctermbg=Red ctermfg=White guibg=darkRed guifg=White
hi Done		        term=standout ctermfg=White ctermbg=Gray    guifg=White guibg=Gray


" not checked

hi PerlPOD	        ctermfg=Brown guifg=#B86A18	gui=NONE
hi Constant	        ctermfg=White guifg=White gui=NONE
hi Special	        ctermfg=DarkMagenta	guifg=Red gui=NONE
hi Identifier 	    ctermfg=Green guifg=Green gui=NONE
hi Statement 	    ctermfg=White guifg=White gui=NONE
hi Function	        ctermfg=White guifg=White gui=NONE
hi Ignore	        ctermfg=black guifg=bg
hi Folded           ctermbg=LightBlue ctermfg=Gray guibg=DarkBlue guifg=DarkGray gui=NONE

hi SpellErrors      ctermfg=DarkRed guifg=Black	gui=NONE

hi MailQ            ctermfg=darkcyan guibg=black	gui=NONE
hi MailQu           ctermfg=darkgreen guibg=black	gui=NONE
hi MyDiffNew	    ctermfg=magenta guifg=red	gui=NONE
hi MyDiffCommLine   ctermfg=white	ctermbg=red	guifg=white guibg=darkred gui=NONE
hi MyDiffRemoved    ctermfg=LightRed guifg=red	gui=NONE
hi MyDiffSubName    ctermfg=DarkCyan guifg=Cyan gui=NONE
hi MyDiffNormal	    ctermbg=White ctermfg=black	guibg=White guifg=black	gui=NONE
hi MoreMsg          gui=NONE
hi ModeMsg          gui=NONE
hi Title            gui=NONE
hi NonText          gui=NONE
hi DiffDelete       gui=NONE
hi DiffText         gui=NONE
hi StatusLine       guifg=black guibg=gray gui=NONE
hi Question         gui=NONE
" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link Tag		Special
hi link Delimiter	Normal
hi link SpecialComment 	Special
hi link Debug		Special


hi GitGutterAdd     cterm=bold  ctermfg=Green   " an added line
hi GitGutterChange  cterm=bold     " a changed line
hi GitGutterDelete  cterm=bold     " at least one removed line
hi GitGutterChangeDelete cterm=bold  " a changed line followed by at least one removed line




"set background=dark
"hi clear
"if exists("syntax_on")
"  syntax reset
"endif

"let g:colors_name = "colorer"

"hi Normal	        ctermfg=Gray guifg=DarkGray guibg=black
"hi Visual	        ctermfg=DarkCyan guibg=black guifg=DarkCyan
"hi Comment	        ctermfg=blue guifg=#0000EE	gui=NONE
"hi PerlPOD	        ctermfg=Brown guifg=#B86A18	gui=NONE
"hi Constant	        ctermfg=White guifg=White gui=NONE
"hi Charachter	    ctermfg=Yellow guifg=Yellow	gui=NONE
"hi String           ctermfg=red guifg=red	gui=NONE
"hi Number	        ctermfg=Brown guifg=#FFA500 gui=NONE
"hi Boolean	        ctermfg=Cyan guifg=DarkGray	gui=NONE
"hi Special	        ctermfg=DarkMagenta	guifg=Red gui=NONE
"hi Define	        ctermfg=LightMagenta guifg=Magenta gui=NONE
"hi Identifier 	    ctermfg=Green guifg=Green gui=NONE
"hi Exception 	    ctermfg=White guifg=White gui=NONE
"hi Statement 	    ctermfg=White guifg=White gui=NONE
"hi Label 	        ctermfg=White guifg=White gui=NONE
"hi Keyword 	        ctermfg=White guifg=White gui=NONE
"hi PreProc	        ctermfg=Green guifg=Green gui=NONE
"hi Type		        ctermfg=LightGreen guifg=Green gui=NONE
"hi Function	        ctermfg=White guifg=White gui=NONE
"hi Repeat	        ctermfg=White guifg=White gui=NONE
"hi Operator	        ctermfg=White guifg=White gui=NONE
"hi Ignore	        ctermfg=black guifg=bg
"hi Folded           ctermbg=LightBlue ctermfg=Gray guibg=DarkBlue guifg=DarkGray gui=NONE
"hi Error	        term=reverse ctermbg=Red ctermfg=White guibg=darkRed guifg=White gui=NONE
"hi Todo		        term=standout ctermbg=Yellow ctermfg=Black guifg=Black guibg=#AD5500 gui=NONE
"hi Done		        term=standout ctermbg=Gray ctermfg=White guifg=White guibg=Gray gui=NONE
"
"hi SpellErrors      ctermfg=DarkRed guifg=Black	gui=NONE
"
"hi MailQ            ctermfg=darkcyan guibg=black	gui=NONE
"hi MailQu           ctermfg=darkgreen guibg=black	gui=NONE
"hi MyDiffNew	    ctermfg=magenta guifg=red	gui=NONE
"hi MyDiffCommLine   ctermfg=white	ctermbg=red	guifg=white guibg=darkred gui=NONE
"hi MyDiffRemoved    ctermfg=LightRed guifg=red	gui=NONE
"hi MyDiffSubName    ctermfg=DarkCyan guifg=Cyan gui=NONE
"hi MyDiffNormal	    ctermbg=White ctermfg=black	guibg=White guifg=black	gui=NONE
"hi MoreMsg          gui=NONE
"hi ModeMsg          gui=NONE
"hi Title            gui=NONE
"hi NonText          gui=NONE
"hi DiffDelete       gui=NONE
"hi DiffText         gui=NONE
"hi StatusLine       guifg=black guibg=gray gui=NONE
"hi Question         gui=NONE
" Common groups that link to default highlighting.
" You can specify other highlighting easily.
"hi link String	Constant
"hi link Character	Constant
"hi link Number		Constant
"hi link Boolean	Constant
"hi link Float		Number
"hi link Conditional	Repeat
"hi link Include		PreProc
"hi link Structure	Define
"hi link Macro		PreProc
"hi link PreCondit	PreProc
"hi link StorageClass	Type
"hi link Structure	Type
"hi link Typedef		Type
"hi link Tag		Special
"hi link SpecialChar	Special
"hi link Delimiter	Normal
"hi link SpecialComment 	Special
"hi link Debug		Special

