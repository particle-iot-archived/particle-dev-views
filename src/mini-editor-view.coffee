{View, TextEditorView} = require 'atom-space-pen-views'

module.exports =
class MiniEditorView extends View
	@content: ->
		@div class: 'particle-dev-mini-editor-view', =>
			@subview 'editor', new TextEditorView(mini: true)
			@div class: 'editor-disabled', outlet: 'editorOverlay'

	initialize: (placeholderText) ->
		@editor.model.setPlaceholderText placeholderText
		@enabled = true
		@editor.on 'focus', =>
			if not @enabled
				@editor.blur()

	destroy: ->

	setEnabled: (isEnabled) ->
		@enabled = isEnabled
		if isEnabled
			@editorOverlay.hide()
		else
			@editorOverlay.show()
			@editor.blur()

	# Show/hide loading spinner
	setLoading: (isLoading=false) ->
		@removeClass 'loading'
		if isLoading
			@addClass 'loading'
