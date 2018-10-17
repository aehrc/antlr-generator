const autosuggest = require('antlr4-autosuggest/antlr4-autosuggest');

const lexerModule = require('./parser/FhircapLexer');
const parserModule = require('./parser/FhircapGrammar');

const autosuggester = autosuggest.autosuggester(lexerModule.FhircapLexer, parserModule.FhircapGrammar, 'LOWER');
var langTools = ace.require("ace/ext/language_tools");
var editor = ace.edit('editor');

editor.setTheme("ace/theme/twilight");
editor.getSession().setMode('ace/mode/my-mode');
editor.setOptions({
  	enableBasicAutocompletion: true,
    enableSnippets: false,
    enableLiveAutocompletion: true
});

var staticWordCompleter = {
    getCompletions: function(editor, session, pos, prefix, callback) {
        let text = originalText = editor.getSession().getDocument().$lines[pos.row].substr(0, pos.column);

        // if (originalText.includes("->")) {
        //     let arr1 = originalText.split('->');
        //     if (arr1[1].includes(",")) {
        //         let arr2 = arr1[1].split(',');
        //         text = arr1[0] + '->' + arr2[arr2.length - 1];
        //     }     
        // }


        let suggestions = autosuggester.autosuggest(text);  
        callback(null, suggestions.map(function(word) {
             return {
                 caption: word,
                 value: word,
                 meta: "fhircap"
             };
        }));
    }
}

langTools.setCompleters([staticWordCompleter])