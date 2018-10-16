ace.define(
  'ace/mode/my-mode',
  [
    "require",
    "exports",
    "module",
    "ace/lib/oop",
    "ace/mode/text",
    "ace/ext/antlr4/token-type-map",
    "ace/ext/antlr4/tokenizer",
    "ace/mode/text_highlight_rules",
    "ace/worker/worker_client"
  ],
  function(require, exports, module) {
    var oop = require("ace/lib/oop");
    var TextMode = require("ace/mode/text").Mode;
    var tokenTypeMapping = antlr4_require('./fhircap-token-type-mapping');
    var createTokenTypeMap = require('ace/ext/antlr4/token-type-map').createTokenTypeMap;
    var tokenTypeToNameMap = createTokenTypeMap(tokenTypeMapping);
    var FhircapLexer = antlr4_require('./parser/FhircapLexer').FhircapLexer;
    var Antlr4Tokenizer = require('ace/ext/antlr4/tokenizer').Antlr4Tokenizer;

    //var TextHighlightRules = require("ace/mode/text_highlight_rules").TextHighlightRules;

    // var MyHighlightRules = function() {
    //     var keywordMapper = this.createKeywordMapper({
    //         "keyword.control": "if|then|else",
    //         "keyword.operator": "and|or|not",
    //         "keyword.other": "class",
    //         "storage.type": "int|float|text",
    //         "storage.modifier": "private|public",
    //         "support.function": "print|sort",
    //         "constant.language": "true|false"
    // }, "identifier");
    //       this.$rules = {
    //           "start": [
    //               { token : "comment", regex : "//" },
    //               { token : "string",  regex : '["](?:(?:\\\\.)|(?:[^"\\\\]))*?["]' },
    //               { token : "constant.numeric", regex : "0[xX][0-9a-fA-F]+\\b" },
    //               { token : "constant.numeric", regex: "[+-]?\\d+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d+)?)?\\b" },
    //               { token : "keyword.operator", regex : "!|%|\\\\|/|\\*|\\-|\\+|~=|==|<>|!=|<=|>=|=|<|>|&&|\\|\\|" },
    //               { token : "punctuation.operator", regex : "\\?|\\:|\\,|\\;|\\." },
    //               { token : "paren.lparen", regex : "[[({]" },
    //               { token : "paren.rparen", regex : "[\\])}]" },
    //               { token : "text", regex : "\\s+" },
    //               { token: keywordMapper, regex: "[a-zA-Z_$][a-zA-Z0-9_$]*\\b" }
    //           ]
    //       };
    // oop.inherits(MyHighlightRules, TextHighlightRules);

    var MyMode = function() {
      // this.HighlightRules = MyHighlightRules;
    };
    oop.inherits(MyMode, TextMode);

    (function() {

      this.$id = "ace/mode/my-mode";

      this.getTokenizer = function() {
        if (!this.$tokenizer) {
          this.$tokenizer = new Antlr4Tokenizer(FhircapLexer, tokenTypeToNameMap);
        }
        return this.$tokenizer;
      };

      var WorkerClient = require("ace/worker/worker_client").WorkerClient;
      this.createWorker = function(session) {
        this.$worker = new WorkerClient(["ace"], "ace/worker/my-worker", "MyWorker");
        this.$worker.attachToDocument(session.getDocument());

        this.$worker.on("errors", function(e) {
          session.setAnnotations(e.data);
        });

        this.$worker.on("annotate", function(e) {
          session.setAnnotations(e.data);
        });

        this.$worker.on("terminate", function() {
          session.clearAnnotations();
        });

        return this.$worker;

      };

    }).call(MyMode.prototype);

    exports.Mode = MyMode;
});