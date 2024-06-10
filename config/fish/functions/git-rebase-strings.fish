function git-rebase-strings
    rg "(<<<<|>>>>)" || echo "No rebase strings found"
end
