if exists("+showtabline") 
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i . ':'
      " let s .= winnr . '/' . tabpagewinnr(i,'$')
" +++++++++++++++++++++++++++++++++++++++++++
      let m = 0  " &modified counter
      " loop through each buffer in a tab
      for b in buflist
        " check and ++ tab's &modified count
        if getbufvar( b, "&modified" )
          let m += 1
        endif
      endfor
      " add modified label [m+] where m pages in tab are modified
      if m > 0
        let s .= '[' . m . '+]'
      endif
" +++++++++++++++++++++++++++++++++++++++++++
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif
