local nightfox = require('nightfox')

nightfox.setup {
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  },
  inverse = {
    match_paren = true
  }
}
nightfox.load()
