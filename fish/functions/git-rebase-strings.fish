function git-rebase-strings \
   --description 'Check if Git rebase strings are still present'

  rg "(<<<<|>>>>)" || echo "No rebase strings found"
end
