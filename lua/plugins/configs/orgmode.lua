local colors = require('kanagawa.colors').setup()

require('orgmode').setup {
  org_todo_keywords = {'TODO', 'WAITING', 'DONE'},
  org_todo_keyword_faces = {
    WAITING = ':foreground ' .. colors.waveBlue2 .. ' :weight bold',
  },
  org_agenda_files = { '~/Documents/orgs/**/*' },
  org_default_notes_file = '~/Documents/orgs/refile.org'
}
