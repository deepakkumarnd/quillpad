import SimpleMDE from 'simplemde';

function launchEditor() {
  const editor = document.getElementById('editor');

  if (editor) {
      var simplemde = new SimpleMDE({
          element: editor,
          autosave: {
              enabled: true,
              uniqueId: "quillpad-post-autosave",
              delay: 1000
          },
          indentWithTabs: false,
          tabSize: 2
      });
  }
}

export default launchEditor;