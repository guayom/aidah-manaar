CKEDITOR.plugins.add 'video',
  icons: 'embed'
  init: (editor) ->
    CKEDITOR.dialog.add 'video', (editor) ->
      title: 'Insert Video'
      minWidth: 500
      minHeight: 400
      contents: [
        {
          id: 'tab-basic'
          label: 'Basic Settings'
          elements: [
            {
              type: 'text'
              id: 'abbr'
              label: 'XXX'
              validate: CKEDITOR.dialog.validate.notEmpty('XXX')
            }
          ]
        }
      ]
      onOk: ->
        alert('OK!')

    editor.addCommand 'video', new CKEDITOR.dialogCommand('video')
    editor.ui.addButton 'Video',
      label: 'Insert Video'
      command: 'video'
      toolbar: 'insert'
