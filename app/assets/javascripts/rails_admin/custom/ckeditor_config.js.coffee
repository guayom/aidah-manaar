$ ->
  initCkeditor = ->
    for editorName, editor of CKEDITOR.instances
      editor.destroy(true) if editor

      CKEDITOR.replace editorName,
        language: 'es'
        toolbar: [
          {
            name: 'document'
            groups: ['mode', 'document', 'doctools']
            items: []
          }, {
            name: 'clipboard'
            groups: ['clipboard', 'undo']
            items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
          }, {
            name: 'editing',
            groups: ['find', 'selection', 'spellchecker'],
            items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt']
          }, '/', {
            name: 'paragraph',
            groups: ['list', 'indent', 'blocks', 'align', 'bidi'],
            items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
          }, {
            name: 'links',
            items: ['Link', 'Unlink', 'Anchor']
          }, {
            name: 'insert',
            items: ['Image', 'Table', 'HorizontalRule', 'SpecialChar']
          }, '/', {
            name: 'styles',
            items: ['Styles', 'Format', 'Font', 'FontSize']
          }, {
            name: 'colors',
            items: ['TextColor', 'BGColor']
          }, {
            name: 'basicstyles',
            groups: ['basicstyles', 'cleanup'],
            items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
          }
        ]
        extraPlugins: 'video'

  $('pjax:complete', initCkeditor)
  initCkeditor()
