module.exports = {
  literals: {
    'keyword.operator': ['NOT','EQ', 'NEQ', 'LT', 'GT','LTE', 'GTE','AND', 'OR', 'THEN', 'WITH'],
    'paren.lparen': ['OPEN_ROUND', 'OPEN_SQUARE'],
    'paren.rparen': ['CLOSE_ROUND', 'CLOSE_SQUARE'],
    'punctuation.operator': ['COMMA', 'SEMI_COLON', 'DOT'],
    'constant.language': ['TRUE', 'FALSE', 'NOTNULL', 'VALUE', 'LABEL', 'LABEL_SELECTED',
     'CONCEPT_SELECTED', 'CONCEPT_LITERAL', 'CONCEPT', 'RESOURCES_EXIST', 'REFERENCE',
     'SYSTEM', 'CODE']
  },
  symbols: {
    'identifier': 'ID',
    'constant.numeric': 'NUMERIC_VALUE',
    'constant.character': ['STRING_VALUE', 'CODE_LITERAL'],
    'comment': 'COMMENT'
  }
};