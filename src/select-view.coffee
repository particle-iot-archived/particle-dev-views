{SelectListView} = require 'atom-space-pen-views'

CompositeDisposable = null

module.exports =
class SelectView extends SelectListView
  initialize: ->
    super

    {CompositeDisposable} = require 'atom'

    @panel = atom.workspace.addModalPanel(item: this, visible: false)

    @disposables = new CompositeDisposable
    @workspaceElement = atom.views.getView(atom.workspace)

  destroy: ->
    @hide()
    @disposables.dispose()

  cancelled: ->
    @hide()

  show: ->
    @panel.show()
    @focusFilterEditor()

  hide: ->
    @panel.hide()
