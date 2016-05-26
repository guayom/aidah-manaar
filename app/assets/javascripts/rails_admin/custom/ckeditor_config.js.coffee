$ ->
  initCkeditor = ->
    for editorName, editor of CKEDITOR.instances
      editor.destroy(true) if editor

      CKEDITOR.replace editorName,
        language: 'es'

  $('pjax:complete', initCkeditor)
  initCkeditor()
