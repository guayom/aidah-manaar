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
              id: 'url'
              label: 'Url of video file (mp4)'
              validate: CKEDITOR.dialog.validate.notEmpty('Url field cannot be empty.')
            }
          ]
        }
      ]
      onOk: ->
        video = editor.document.createElement('video')
        video.setAttribute('class', 'video-js vjs-default-skin')
        video.setAttribute('controls', true)
        video.setAttribute('data-setup', '{}')
        video.setAttribute('preload', 'auto')
        video.setAttribute('src', this.getValueOf('tab-basic', 'url'))
        video.setAttribute('width', 520)
        video.setAttribute('height', 390)

        editor.insertElement(video);

    editor.addCommand 'video', new CKEDITOR.dialogCommand('video')
    editor.ui.addButton 'Video',
      label: 'Insert Video'
      command: 'video'
      toolbar: 'insert'
