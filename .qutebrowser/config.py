config.load_autoconfig(False)

# Start page
c.url.default_page = 'about:blank'

# Session
c.auto_save.session = True

# Fonts
c.fonts.default_size = '14pt'
c.fonts.default_family = 'LigaConsolas Nerd Font'

# Tab position/sizing
c.tabs.padding = {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}
c.tabs.position = 'left'
c.tabs.width = '12%'

# Enable tree style tabs feature
c.tabs.tree_tabs = True
c.tabs.new_position.tree.promote = 'next'
c.tabs.new_position.tree.demote = 'last'
c.tabs.new_position.tree.new_toplevel = 'last'
c.tabs.new_position.tree.new_sibling = 'next'
c.tabs.new_position.tree.new_child = 'last'

# Hide native window decoration
c.window.hide_decoration = True

# Enable smooth scrolling
c.scrolling.smooth = True

# Disable autoplay
c.content.autoplay = False

with config.pattern("*://accounts.google.com/*") as g:
    g.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:130.0) Gecko/20100101 Firefox/130"

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://search.brave.com/search?q={}",
    "b": "https://search.brave.com/search?q={}",
    "g": "https://google.com/search?q={}",
    'sp': 'https://www.startpage.com/do/search?q={}',
    "ddg": "https://duckduckgo.com/?q={}",
    "rd": "https://www.reddit.com/search/?q={}",
    "w": "https://en.wikipedia.org/w/index.php?search={}",
}

# Adblock
c.content.blocking.method = 'auto'
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://malware-filter.gitlab.io/malware-filter/urlhaus-filter.txt',
    'https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts',
    'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_8_Dutch/filter.txt'
]

# Colors
c.colors.completion.fg = '#d5c4a1'
c.colors.completion.odd.bg = '#333333'
c.colors.completion.even.bg = '#202020'
c.colors.completion.item.selected.bg = '#8fee96'
c.colors.completion.item.selected.border.top = '#151515'
c.colors.completion.item.selected.border.bottom = '#151515'
c.colors.completion.match.fg = '#d75f5f'
c.colors.downloads.bar.bg = '#202020'
c.colors.statusbar.normal.fg = '#d5c4a1'
c.colors.statusbar.normal.bg = '#202020'
c.colors.statusbar.command.fg = '#d4c5a1'
c.colors.statusbar.command.bg = '#202020'
c.colors.statusbar.url.fg = '#d5c4a1'
c.colors.statusbar.url.error.fg = '#d75f5f'
c.colors.statusbar.url.success.http.fg = '#84edb9'
c.colors.statusbar.url.success.https.fg = '#8fee96'
c.colors.statusbar.url.warn.fg = '#cd950c'
c.colors.tabs.bar.bg = '#202020'
c.colors.tabs.odd.fg = '#707070'
c.colors.tabs.odd.bg = '#202020'
c.colors.tabs.even.fg = '#707070'
c.colors.tabs.even.bg = '#202020'
c.colors.tabs.selected.odd.fg = '#d5c4a1'
c.colors.tabs.selected.odd.bg = '#202020'
c.colors.tabs.selected.even.fg = '#d5c4a1'
c.colors.tabs.selected.even.bg = '#202020'

# Bindings
config.bind('X', 'hint links spawn /opt/homebrew/bin/fish -c "mpv --ontop --no-border --snap-window --geometry=25%-0+0 --script-opts=osc-barmargin=20,osc-vidscale=2 \'{hint-url}\'"')
config.bind('xx', 'spawn /opt/homebrew/bin/fish -c "mpv --ontop --no-border --snap-window --geometry=25%-0+0 --script-opts=osc-barmargin=20,osc-vidscale=2 \'{url:pretty}\'"')

config.bind('F', 'hint all run open -tS {hint-url}')
config.bind('<alt+f>', 'hint all run open -t {hint-url}')
config.bind('<Meta+f>', 'hint all run open -tr {hint-url}')

config.bind('O', 'cmd-set-text -s :open -tS')
config.bind('<alt+o>', 'cmd-set-text -s :open -t')
config.bind('<Meta+o>', 'cmd-set-text -s :open -tr')
config.bind('<Meta+shift+o>', 'cmd-set-text :open {url:pretty}')

config.bind('zz', 'tree-tab-toggle-hide')
config.bind('zk', 'tab-focus parent')
config.bind('zg', 'cmd-set-text -s :tree-tab-create-group')
config.bind('zr', 'cmd-set-text -s :tree-tab-create-group -r')

config.bind('<Meta+shift+j>', 'tab-move +')
config.bind('<Meta+shift+k>', 'tab-move -')

# Save to Raindrop
c.aliases['raindrop'] = 'open -t https://app.raindrop.io/add?link={url:pretty}'

# Quit and save session
c.aliases['x'] = 'quit --save'

