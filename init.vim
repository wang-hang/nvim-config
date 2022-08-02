" 加载lua配置文件内的插件
lua require("init")

" 插件列表
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-vimlsp',
    \'coc-tsserver',
    \'coc-emmet',
    \'coc-pairs',
    \'coc-git',
    \'coc-lua',
    \'coc-eslint',
    \'coc-prettier',
    \'coc-vetur',
    \'coc-snippets',
    \ ]

" super tab

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" 有弹窗时回车关闭弹窗并非换行
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 回车选中自动补全
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" 代码定义跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 跳转到上一个错误和下一个错误
nmap <silent> <LEADER>p <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>n <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)



" K 显示悬浮窗，例如文档，类型等
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>


" 代码片段跳转上一个和下一个placeholder
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
