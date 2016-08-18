ReturnValue = require 'nanocyte-component-return-value'
SetMessageOnData = require '../src/set-message-on-data'

describe 'SetMessageOnData', ->
  beforeEach ->
    @sut = new SetMessageOnData transactionGroupId: 'hi'

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with message it should add to object', ->
      beforeEach ->
        @envelope =
          message: "test2"
          data: { 'yo': 'mama'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal yo: 'mama', hi: 'test2'

    describe 'when called with null data it should create it and then add', ->
      beforeEach ->
        @envelope =
          message: "test2"
          data: null
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal hi: 'test2'

    describe 'when called with empty data it should add to object', ->
      beforeEach ->
        @envelope =
          message: "test2"
          data: {}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal hi: 'test2'

    describe 'when called with message in object form', ->
      beforeEach ->
        @envelope =
          message: {"test2" : 50}
          data: {'bleep':'blarg'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal {'bleep':'blarg', 'hi':{"test2" : 50}}
