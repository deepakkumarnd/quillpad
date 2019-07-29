"use strict";

function launchEditor() {
    if (document.getElementById('editor')) {
        var simplemde = new SimpleMDE({
            element: document.getElementById('editor'),
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
