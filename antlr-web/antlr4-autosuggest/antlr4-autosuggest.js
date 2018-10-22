(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["Antlr4Autosuggest"] = factory();
	else
		root["Antlr4Autosuggest"] = factory();
})(typeof self !== 'undefined' ? self : this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

module.exports = require("debug");

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


// Useful constants for working with Antlr4 ATNs that are not made public by the runtime
var ATOM_TRANSITION = 5;
var SET_TRANSITION = 7;

exports.ATOM_TRANSITION = ATOM_TRANSITION;
exports.SET_TRANSITION = SET_TRANSITION;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var antlr4 = __webpack_require__(3);
var TokenSuggester = __webpack_require__(4);
var debug = __webpack_require__(0)('autosuggest');
var constants = __webpack_require__(1);

function AutoSuggestionsGenerator(lexerAndParserFactory, input) {
    this._lexerAndParserFactory = lexerAndParserFactory;
    this._input = input;
    this._inputTokens = [];
    this._untokenizedText = '';
    this._parserAtn = null;
    this._parserRuleNames = [];
    this._indent = '';
    this._collectedSuggestions = [];
    this._casePreference = 'BOTH';
    this._parserStateToTokenListIndexWhereLastVisited = new Map();

    return this;
}

var transToStr = function transToStr(trans) {
    return '' + trans.constructor.name + '->' + trans.target;
};

AutoSuggestionsGenerator.prototype.constructor = AutoSuggestionsGenerator;

AutoSuggestionsGenerator.prototype.suggest = function () {
    this._tokenizeInput();
    this._storeParserAtnAndRuleNames();
    this._runParserAtnAndCollectSuggestions();
    return this._collectedSuggestions;
};

AutoSuggestionsGenerator.prototype.setCasePreference = function (casePreference) {
    this._casePreference = casePreference;
};

AutoSuggestionsGenerator.prototype._tokenizeInput = function () {
    var lexer = this._createLexerWithUntokenizedTextDetection();
    var allTokens = lexer.getAllTokens(); // side effect: also fills this.untokenizedText
    this._inputTokens = this._filterOutNonDefaultChannels(allTokens);
    debug('TOKENS FOUND IN FIRST PASS:');
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
        for (var _iterator = this._inputTokens[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
            var token = _step.value;

            debug('' + token);
        }
    } catch (err) {
        _didIteratorError = true;
        _iteratorError = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion && _iterator.return) {
                _iterator.return();
            }
        } finally {
            if (_didIteratorError) {
                throw _iteratorError;
            }
        }
    }

    debug('UNTOKENIZED: ' + this._untokenizedText);
};

AutoSuggestionsGenerator.prototype._filterOutNonDefaultChannels = function (tokens) {
    return tokens.filter(function (token) {
        return token.channel === 0;
    });
};

AutoSuggestionsGenerator.prototype._createLexerWithUntokenizedTextDetection = function () {
    var lexer = this._createDefaultLexer();
    lexer.removeErrorListeners();
    var self = this;
    var newErrorListener = Object.create(antlr4.error.ErrorListener);
    newErrorListener.syntaxError = function (recognizer, offendingSymbol, line, column, msg, e) {
        self._untokenizedText = self._input.substring(column);
    };
    lexer.addErrorListener(newErrorListener);
    return lexer;
};

AutoSuggestionsGenerator.prototype._createDefaultLexer = function () {
    return this._createLexer(this._input);
};

AutoSuggestionsGenerator.prototype._createLexer = function (lexerInput) {
    var inputStream = new antlr4.InputStream(lexerInput);
    var lexer = this._lexerAndParserFactory.createLexer(inputStream);
    return lexer;
};

AutoSuggestionsGenerator.prototype._storeParserAtnAndRuleNames = function () {
    var tokenStream = new antlr4.CommonTokenStream(this._createDefaultLexer());
    var parser = this._lexerAndParserFactory.createParser(tokenStream);
    debug('Parser rule names: ' + parser.ruleNames.join(', '));
    this._parserAtn = parser.atn;
    this._parserRuleNames = parser.ruleNames;
};

AutoSuggestionsGenerator.prototype._runParserAtnAndCollectSuggestions = function () {
    var initialState = this._parserAtn.states[0];
    this._parseAndCollectTokenSuggestions(initialState, 0);
};

AutoSuggestionsGenerator.prototype._parseAndCollectTokenSuggestions = function (parserState, tokenListIndex) {
    var prevIndent = this._indent;
    this._indent += '  ';
    if (this._didVisitParserStateOnThisTokenIndex(parserState, tokenListIndex)) {
        debug(this._indent + "State " + parserState + " had already been visited while processing token " + tokenListIndex + ", backtracking to avoid infinite loop.");
        return;
    }
    var previousTokenListIndexForThisState = this._setParserStateLastVisitedOnThisTokenIndex(parserState, tokenListIndex);
    try {
        debug(this._indent + 'State: ' + parserState + ' (type: ' + parserState.constructor.name + ')');
        // debug(indent + 'State available transitions: ' + transitionsStr(parserState));

        if (!this._haveMoreTokens(tokenListIndex)) {
            // stop condition for recursion
            this._suggestNextTokensForParserState(parserState);
            return;
        }
        var _iteratorNormalCompletion2 = true;
        var _didIteratorError2 = false;
        var _iteratorError2 = undefined;

        try {
            for (var _iterator2 = parserState.transitions[Symbol.iterator](), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
                var trans = _step2.value;

                if (trans.isEpsilon) {
                    this._handleEpsilonTransition(trans, tokenListIndex);
                } else if (trans.serializationType === constants.ATOM_TRANSITION) {
                    this._handleAtomicTransition(trans, tokenListIndex);
                } else {
                    this._handleSetTransition(trans, tokenListIndex);
                }
            }
        } catch (err) {
            _didIteratorError2 = true;
            _iteratorError2 = err;
        } finally {
            try {
                if (!_iteratorNormalCompletion2 && _iterator2.return) {
                    _iterator2.return();
                }
            } finally {
                if (_didIteratorError2) {
                    throw _iteratorError2;
                }
            }
        }
    } finally {
        this._indent = prevIndent;
        this._setParserStateLastVisitedOnThisTokenIndex(parserState, previousTokenListIndexForThisState);
    }
};

AutoSuggestionsGenerator.prototype._didVisitParserStateOnThisTokenIndex = function (parserState, currentTokenListIndex) {
    var lastVisitedThisStateAtTokenListIndex = this._parserStateToTokenListIndexWhereLastVisited.get(parserState);
    return currentTokenListIndex === lastVisitedThisStateAtTokenListIndex;
};

AutoSuggestionsGenerator.prototype._setParserStateLastVisitedOnThisTokenIndex = function (parserState, tokenListIndex) {
    var previous = this._parserStateToTokenListIndexWhereLastVisited.get(parserState);
    if (typeof tokenListIndex === 'undefined') {
        this._parserStateToTokenListIndexWhereLastVisited.delete(parserState);
    } else {
        this._parserStateToTokenListIndexWhereLastVisited.set(parserState, tokenListIndex);
    }
    return previous;
};

AutoSuggestionsGenerator.prototype._haveMoreTokens = function (index) {
    return index < this._inputTokens.length;
};

AutoSuggestionsGenerator.prototype._handleEpsilonTransition = function (trans, tokenListIndex) {
    this._parseAndCollectTokenSuggestions(trans.target, tokenListIndex);
};

AutoSuggestionsGenerator.prototype._handleAtomicTransition = function (trans, tokenListIndex) {
    var nextToken = this._inputTokens.slice(tokenListIndex, tokenListIndex + 1)[0];
    var nextTokenType = nextToken.type;
    var nextTokenMatchesTransition = trans.label.contains(nextTokenType);
    if (nextTokenMatchesTransition) {
        this._parseAndCollectTokenSuggestions(trans.target, tokenListIndex + 1);
    }
};

AutoSuggestionsGenerator.prototype._handleSetTransition = function (trans, tokenListIndex) {
    var nextToken = this._inputTokens.slice(tokenListIndex, tokenListIndex + 1)[0];
    var nextTokenType = nextToken.type;
    var _iteratorNormalCompletion3 = true;
    var _didIteratorError3 = false;
    var _iteratorError3 = undefined;

    try {
        for (var _iterator3 = trans.label.intervals[Symbol.iterator](), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
            var interval = _step3.value;

            for (var transitionTokenType = interval.start; transitionTokenType <= interval.stop; ++transitionTokenType) {
                var nextTokenMatchesTransition = transitionTokenType === nextTokenType;
                if (nextTokenMatchesTransition) {
                    debug(this._indent + 'Token ' + nextToken + ' following transition: ' + transToStr(trans) + ' to ' + transitionTokenType);
                    this._parseAndCollectTokenSuggestions(trans.target, tokenListIndex + 1);
                } else {
                    debug(this._indent + 'Token ' + nextToken + ' NOT following transition: ' + transToStr(trans) + ' to ' + transitionTokenType);
                }
            }
        }
    } catch (err) {
        _didIteratorError3 = true;
        _iteratorError3 = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion3 && _iterator3.return) {
                _iterator3.return();
            }
        } finally {
            if (_didIteratorError3) {
                throw _iteratorError3;
            }
        }
    }
};

AutoSuggestionsGenerator.prototype._suggestNextTokensForParserState = function (parserState) {
    var transitionLabels = new Set();
    this._fillParserTransitionLabels(parserState, transitionLabels, new Set());
    var tokenSuggester = new TokenSuggester.TokenSuggester(this._createDefaultLexer(), this._casePreference);
    var suggestions = tokenSuggester.suggest(transitionLabels, this._untokenizedText);
    this._parseSuggestionsAndAddValidOnes(parserState, suggestions);
    // logger.debug(indent + 'WILL SUGGEST TOKENS FOR STATE: ' + parserState);
};

var toTransKey = function toTransKey(src, trans) {
    return '' + src.stateNumber + '->(' + trans.serializationType + ') ' + trans.target.stateNumber;
};

AutoSuggestionsGenerator.prototype._fillParserTransitionLabels = function (parserState, result, visitedTransitions) {
    var _iteratorNormalCompletion4 = true;
    var _didIteratorError4 = false;
    var _iteratorError4 = undefined;

    try {
        for (var _iterator4 = parserState.transitions[Symbol.iterator](), _step4; !(_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done); _iteratorNormalCompletion4 = true) {
            var trans = _step4.value;

            var transKey = toTransKey(parserState, trans);
            if (visitedTransitions.has(transKey)) {
                debug(this._indent + 'Not following visited ' + transKey);
                return;
            }
            if (trans.isEpsilon) {
                visitedTransitions.add(transKey);
                try {
                    this._fillParserTransitionLabels(trans.target, result, visitedTransitions);
                } finally {
                    visitedTransitions.delete(transKey);
                }
            } else if (trans.serializationType === constants.ATOM_TRANSITION) {
                result.add(trans.label_);
            } else if (trans.serializationType === constants.SET_TRANSITION) {
                var _iteratorNormalCompletion5 = true;
                var _didIteratorError5 = false;
                var _iteratorError5 = undefined;

                try {
                    for (var _iterator5 = trans.label.intervals[Symbol.iterator](), _step5; !(_iteratorNormalCompletion5 = (_step5 = _iterator5.next()).done); _iteratorNormalCompletion5 = true) {
                        var interval = _step5.value;

                        for (var i = interval.start; i < interval.stop; ++i) {
                            result.add(i);
                        }
                    }
                } catch (err) {
                    _didIteratorError5 = true;
                    _iteratorError5 = err;
                } finally {
                    try {
                        if (!_iteratorNormalCompletion5 && _iterator5.return) {
                            _iterator5.return();
                        }
                    } finally {
                        if (_didIteratorError5) {
                            throw _iteratorError5;
                        }
                    }
                }

                ;
            }
        }
    } catch (err) {
        _didIteratorError4 = true;
        _iteratorError4 = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion4 && _iterator4.return) {
                _iterator4.return();
            }
        } finally {
            if (_didIteratorError4) {
                throw _iteratorError4;
            }
        }
    }

    ;
};

AutoSuggestionsGenerator.prototype._parseSuggestionsAndAddValidOnes = function (parserState, suggestions) {
    var _iteratorNormalCompletion6 = true;
    var _didIteratorError6 = false;
    var _iteratorError6 = undefined;

    try {
        for (var _iterator6 = suggestions[Symbol.iterator](), _step6; !(_iteratorNormalCompletion6 = (_step6 = _iterator6.next()).done); _iteratorNormalCompletion6 = true) {
            var suggestion = _step6.value;

            var addedToken = this._getAddedToken(suggestion);
            if (this._isParseableWithAddedToken(parserState, addedToken, new Set())) {

                if (!this._collectedSuggestions.includes(suggestion)) {
                    this._collectedSuggestions.push(suggestion);
                }
            } else {
                debug('DROPPING non-parseable suggestion: ' + suggestion);
            }
        }
    } catch (err) {
        _didIteratorError6 = true;
        _iteratorError6 = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion6 && _iterator6.return) {
                _iterator6.return();
            }
        } finally {
            if (_didIteratorError6) {
                throw _iteratorError6;
            }
        }
    }

    ;
};

AutoSuggestionsGenerator.prototype._getAddedToken = function (suggestedCompletion) {
    var completedText = this._input + suggestedCompletion;
    var completedTextLexer = this._createLexer(completedText);
    completedTextLexer.removeErrorListeners();
    var completedTextTokens = this._filterOutNonDefaultChannels(completedTextLexer.getAllTokens());
    if (completedTextTokens.length <= this._inputTokens.length) {
        return null; // Completion didn't yield whole token, could be just a token fragment
    }
    var newToken = completedTextTokens[completedTextTokens.length - 1];
    return newToken;
};

AutoSuggestionsGenerator.prototype._isParseableWithAddedToken = function (parserState, newToken, visitedTransitions) {
    if (newToken == null) {
        return false;
    }
    var parseable = false;
    var _iteratorNormalCompletion7 = true;
    var _didIteratorError7 = false;
    var _iteratorError7 = undefined;

    try {
        for (var _iterator7 = parserState.transitions[Symbol.iterator](), _step7; !(_iteratorNormalCompletion7 = (_step7 = _iterator7.next()).done); _iteratorNormalCompletion7 = true) {
            var parserTransition = _step7.value;

            if (parserTransition.isEpsilon) {
                // Recurse through any epsilon transitions
                var transKey = toTransKey(parserState, parserTransition);
                if (visitedTransitions.has(transKey)) {
                    debug(this._indent + 'Not following visited ' + transKey);
                    return;
                }
                visitedTransitions.add(transKey);
                try {
                    if (this._isParseableWithAddedToken(parserTransition.target, newToken, visitedTransitions)) {
                        parseable = true;
                    }
                } finally {
                    visitedTransitions.delete(transKey);
                }
            } else if (parserTransition.serializationType === constants.ATOM_TRANSITION) {
                var transitionTokenType = parserTransition.label;
                if (transitionTokenType.first() === newToken.type) {
                    parseable = true;
                }
            } else if (parserTransition.serializationType === constants.SET_TRANSITION) {
                var _iteratorNormalCompletion8 = true;
                var _didIteratorError8 = false;
                var _iteratorError8 = undefined;

                try {
                    for (var _iterator8 = parserTransition.label.intervals[Symbol.iterator](), _step8; !(_iteratorNormalCompletion8 = (_step8 = _iterator8.next()).done); _iteratorNormalCompletion8 = true) {
                        var interval = _step8.value;

                        for (var _transitionTokenType = interval.start; _transitionTokenType <= interval.stop; ++_transitionTokenType) {
                            if (_transitionTokenType === newToken.type) {
                                parseable = true;
                            }
                        }
                    }
                } catch (err) {
                    _didIteratorError8 = true;
                    _iteratorError8 = err;
                } finally {
                    try {
                        if (!_iteratorNormalCompletion8 && _iterator8.return) {
                            _iterator8.return();
                        }
                    } finally {
                        if (_didIteratorError8) {
                            throw _iteratorError8;
                        }
                    }
                }

                ;
            } else {
                throw 'Unexpected: ' + transToStr(parserTransition);
            }
        }
    } catch (err) {
        _didIteratorError7 = true;
        _iteratorError7 = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion7 && _iterator7.return) {
                _iterator7.return();
            }
        } finally {
            if (_didIteratorError7) {
                throw _iteratorError7;
            }
        }
    }

    ;
    return parseable;
};

function AutoSuggester(lexerCtr, parserCtr) {
    var casePreference = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    this._lexerCtr = lexerCtr;
    this._parserCtr = parserCtr;
    this._casePreference = casePreference;
    this._assertLexerHasAtn();
    return this;
}

AutoSuggester.prototype.constructor = AutoSuggester;

AutoSuggester.prototype.createLexer = function (input) {
    return new this._lexerCtr(input);
};
AutoSuggester.prototype.createParser = function (tokenStream) {
    return new this._parserCtr(tokenStream);
};
AutoSuggester.prototype.autosuggest = function (inputText) {
    var generator = new AutoSuggestionsGenerator(this, inputText);
    debug("CASE_PREF : " + this._casePreference);
    if (this._casePreference) {
        generator.setCasePreference(this._casePreference);
    }
    return generator.suggest();
};

AutoSuggester.prototype._assertLexerHasAtn = function () {
    var lexer = new this._lexerCtr(null);
    if (typeof lexer.atn === 'undefined') {
        throw "Please use ANTLR4 version 4.7.1 or above.";
    }
    return lexer;
};

var autosuggester = function autosuggester(lexerCtr, parserCtr) {
    var casePref = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    return new AutoSuggester(lexerCtr, parserCtr, casePref);
};

module.exports.autosuggester = autosuggester;

/***/ }),
/* 3 */
/***/ (function(module, exports) {

module.exports = require("antlr4");

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var debug = __webpack_require__(0)('tokensuggester');
var constants = __webpack_require__(1);

function TokenSuggester(lexer) {
    var casePreference = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;

    this._lexer = lexer;
    this._suggestions = [];
    this._visitedLexerStates = [];
    this._origPartialToken = '';
    this._casePreference = casePreference;
    return this;
}

TokenSuggester.prototype.constructor = TokenSuggester;

TokenSuggester.prototype.suggest = function (nextParserTransitionLabels, remainingText) {
    debug("Suggesting tokens for rule numbers: " + nextParserTransitionLabels);
    this._origPartialToken = remainingText;
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
        for (var _iterator = nextParserTransitionLabels[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
            var nextParserTransitionLabel = _step.value;

            var nextTokenRuleNumber = nextParserTransitionLabel - 1; // Count from 0 not from 1
            var lexerState = this._findLexerStateByRuleNumber(nextTokenRuleNumber);
            this._suggest('', lexerState, remainingText);
        }
    } catch (err) {
        _didIteratorError = true;
        _iteratorError = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion && _iterator.return) {
                _iterator.return();
            }
        } finally {
            if (_didIteratorError) {
                throw _iteratorError;
            }
        }
    }

    return this._suggestions;
};

TokenSuggester.prototype._findLexerStateByRuleNumber = function (ruleNumber) {
    return this._lexer.atn.ruleToStartState.slice(ruleNumber, ruleNumber + 1)[0];
};

TokenSuggester.prototype._suggest = function (tokenSoFar, lexerState, remainingText) {
    debug('SUGGEST: tokenSoFar=' + tokenSoFar + ' remainingText=' + remainingText + ' lexerState=' + lexerState);
    if (this._visitedLexerStates.includes(lexerState.stateNumber)) {
        return; // avoid infinite loop and stack overflow
    }
    this._visitedLexerStates.push(lexerState.stateNumber);
    try {
        var tokenNotEmpty = tokenSoFar.length > 0;
        var noMoreCharactersInToken = lexerState.transitions.length === 0;
        if (tokenNotEmpty && noMoreCharactersInToken) {
            this._addSuggestedToken(tokenSoFar);
        }
        var _iteratorNormalCompletion2 = true;
        var _didIteratorError2 = false;
        var _iteratorError2 = undefined;

        try {
            for (var _iterator2 = lexerState.transitions[Symbol.iterator](), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
                var trans = _step2.value;

                this._suggestViaLexerTransition(tokenSoFar, remainingText, trans);
            }
        } catch (err) {
            _didIteratorError2 = true;
            _iteratorError2 = err;
        } finally {
            try {
                if (!_iteratorNormalCompletion2 && _iterator2.return) {
                    _iterator2.return();
                }
            } finally {
                if (_didIteratorError2) {
                    throw _iteratorError2;
                }
            }
        }
    } finally {
        this._visitedLexerStates.pop();
    }
};

var _calcAllLabelChars = function _calcAllLabelChars(label) {
    var allLabelChars = [];
    var _iteratorNormalCompletion3 = true;
    var _didIteratorError3 = false;
    var _iteratorError3 = undefined;

    try {
        for (var _iterator3 = label.intervals[Symbol.iterator](), _step3; !(_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done); _iteratorNormalCompletion3 = true) {
            var interval = _step3.value;

            for (var codePoint = interval.start; codePoint < interval.stop; ++codePoint) {
                allLabelChars.push(String.fromCharCode(codePoint));
            }
        }
    } catch (err) {
        _didIteratorError3 = true;
        _iteratorError3 = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion3 && _iterator3.return) {
                _iterator3.return();
            }
        } finally {
            if (_didIteratorError3) {
                throw _iteratorError3;
            }
        }
    }

    return allLabelChars;
};

TokenSuggester.prototype._suggestViaLexerTransition = function (tokenSoFar, remainingText, trans) {
    if (trans.isEpsilon) {
        this._suggest(tokenSoFar, trans.target, remainingText);
    } else if (trans.serializationType === constants.ATOM_TRANSITION) {
        var newTokenChar = this._getAddedTextFor(trans);
        if (remainingText === '' || remainingText.startsWith(newTokenChar)) {
            debug("LEXER TOKEN: " + newTokenChar + " remaining=" + remainingText);
            this._suggestViaNonEpsilonLexerTransition(tokenSoFar, remainingText, newTokenChar, trans.target);
        } else {
            debug("NONMATCHING LEXER TOKEN: " + newTokenChar + " remaining=" + remainingText);
        }
    } else if (trans.serializationType === constants.SET_TRANSITION) {
        var allLabelChars = _calcAllLabelChars(trans.label);
        var _iteratorNormalCompletion4 = true;
        var _didIteratorError4 = false;
        var _iteratorError4 = undefined;

        try {
            for (var _iterator4 = trans.label.intervals[Symbol.iterator](), _step4; !(_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done); _iteratorNormalCompletion4 = true) {
                var interval = _step4.value;

                for (var codePoint = interval.start; codePoint <= interval.stop; ++codePoint) {
                    var ch = String.fromCodePoint(codePoint);
                    var shouldIgnoreCase = this._shouldIgnoreThisCase(ch, allLabelChars);
                    var _newTokenChar = String.fromCodePoint(codePoint);
                    if (!shouldIgnoreCase && (remainingText === '' || remainingText.startsWith(_newTokenChar))) {
                        this._suggestViaNonEpsilonLexerTransition(tokenSoFar, remainingText, _newTokenChar, trans.target);
                    }
                }
            }
        } catch (err) {
            _didIteratorError4 = true;
            _iteratorError4 = err;
        } finally {
            try {
                if (!_iteratorNormalCompletion4 && _iterator4.return) {
                    _iterator4.return();
                }
            } finally {
                if (_didIteratorError4) {
                    throw _iteratorError4;
                }
            }
        }
    }
};

TokenSuggester.prototype._suggestViaNonEpsilonLexerTransition = function (tokenSoFar, remainingText, newTokenChar, targetState) {
    var newRemainingText = remainingText.length > 0 ? remainingText.substr(1) : '';
    this._suggest(tokenSoFar + newTokenChar, targetState, newRemainingText);
};

TokenSuggester.prototype._addSuggestedToken = function (tokenToAdd) {
    var justTheCompletionPart = this._chopOffCommonStart(tokenToAdd, this._origPartialToken);
    if (!this._suggestions.includes(justTheCompletionPart)) {
        debug("SUGGESTIONG: " + justTheCompletionPart);
        this._suggestions.push(justTheCompletionPart);
    }
};

TokenSuggester.prototype._chopOffCommonStart = function (a, b) {
    var charsToChopOff = Math.min(a.length, b.length);
    return a.substr(charsToChopOff, a.length - charsToChopOff);
};

TokenSuggester.prototype._getAddedTextFor = function (transition) {
    return String.fromCodePoint(transition.label);
};

TokenSuggester.prototype._shouldIgnoreThisCase = function (transChar, allTransChars) {
    if (this._casePreference == null || this._casePreference === 'BOTH') {
        return false;
    }
    var upper = transChar.toUpperCase();
    var lower = transChar.toLowerCase();
    switch (this._casePreference) {
        case 'LOWER':
            return transChar === upper && allTransChars.includes(lower);
        case 'UPPER':
            return transChar === lower && allTransChars.includes(upper);
        default:
            return false;
    }
};

exports.TokenSuggester = TokenSuggester;

/***/ })
/******/ ]);
});