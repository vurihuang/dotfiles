vim.cmd [[
  " coc
  " highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  augroup CocGroup
    autocmd!
    " setup formatexpr specified filetypes.
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]]

