local status_comment, comment = pcall(require, 'Comment')
local status_neogen, neogen = pcall(require, 'neogen')
if not (status_comment and status_neogen) then
    return
end

comment.setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

neogen.setup({
    enabled = true,
    snippet_engine = 'luasnip',
})
