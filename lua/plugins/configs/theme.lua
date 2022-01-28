local nightfox = require('nightfox')

nightfox.setup {
  fox = 'nordfox',
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  },
}

nightfox.load()
