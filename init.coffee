# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#

beforeSaveDo =
  whitespace: [
    'remove-trailing-whitespace'
    'conver-spaces-to-tabs'
  ]

class Helpers
  @dispatchCommands = (commandsHash) ->
    for namespace in commandsHash
      commandList = commandsHash[namespace]
      for command in commandlist
        atom.commands.dispatch atom.workspaceView, "#{namespace}:#{command}"

atom.workspace.observeTextEditors (editor) ->
  editor.on 'will-save', ->
    Helpers.dispatchCommands beforeSaveDo
