var langTools = ace.require("ace/ext/language_tools");
var editor = ace.edit('editor');

editor.setTheme("ace/theme/twilight");
editor.getSession().setMode('ace/mode/my-mode');
editor.setOptions({
  	enableBasicAutocompletion: true,
    enableSnippets: false,
    enableLiveAutocompletion: false
});

var staticWordCompleter = {
    getCompletions: function(editor, session, pos, prefix, callback) {
        var wordList = ["float", "void", "int", "then", "return"];
        callback(null, wordList.map(function(word) {
            return {
                caption: word,
                value: word,
                meta: "static"
            };
        }));

    }
}

langTools.setCompleters([staticWordCompleter])
// or 
//editor.completers = [staticWordCompleter]

// uses http://rhymebrain.com/api.html
//    var rhymeCompleter = {
//        getCompletions: function(editor, session, pos, prefix, callback) {
    //         if (prefix.length === 0) { callback(null, []); return }
    //         $.getJSON(
    //             "http://rhymebrain.com/talk?function=getRhymes&word=" + prefix,
    //             function(wordList) {
    //                 // wordList like [{"word":"flow","freq":24,"score":300,"flags":"bc","syllables":"1"}]
    //                 callback(null, wordList.map(function(ea) {
    //                     return {name: ea.word, value: ea.word, score: ea.score, meta: "rhyme"}
    //                 }));
    //             })
    //     }
    // }
