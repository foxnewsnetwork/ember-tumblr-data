`import Parser from 'ember-tumblr-data/utils/general-parser'`
`import { module, test } from 'qunit'`

module 'GeneralParser'

bodyYaml = """
#!yaml
cat: 3
pic: http://doit.fag.go/#/t.png
"""
bodyJson = """
#!json
{
  "dog": 13,
  "neg": "13ff"
}
"""
bodyYaml2 = """
cat: 3
pic: http://doit.fag.go/#/t.png
"""
bodyJson2 = """
{
  "dog": 13,
  "neg": "13ff"
}
"""

# Replace this with your real tests.
test 'it works', (assert) ->
  assert.ok Parser

test 'consume should work', (assert) ->
  {tokens, rest} = Parser.consume("#!yaml\n") bodyYaml
  assert.deepEqual tokens, ["#!yaml\n"]
  assert.equal rest, bodyYaml2

test 'chainParser should chain together parsers', (assert) ->
  parse = Parser.chainParser Parser.consume("#!"), Parser.consume("yaml\n")
  {tokens, rest} = parse bodyYaml
  assert.deepEqual tokens, ["#!", "yaml\n"]
  assert.equal rest, bodyYaml2

test 'tryOneOf should work', (assert) ->
  parser = Parser.tryOneOf("#!yaml\n", "#!json\n")
  {tokens, rest} =  parser bodyYaml
  assert.deepEqual tokens, ["#!yaml\n"]
  assert.equal rest, bodyYaml2
  {tokens, rest} =  parser bodyJson
  assert.deepEqual tokens, ["#!json\n"]
  assert.equal rest, bodyJson2

test 'it should be able to decide type', (assert) ->
  {type, rest} = Parser.decideType bodyYaml
  assert.equal type, "yaml"
  assert.equal rest, bodyYaml2