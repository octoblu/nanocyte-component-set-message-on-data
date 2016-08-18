_ = require 'lodash'
ReturnValue = require 'nanocyte-component-return-value'

class SetMessageOnData extends ReturnValue
  constructor: (@metadata)->
    super @metadata
  onEnvelope: (envelope) =>
    {data, message} = envelope

    data = {} unless _.isObject data
    data[@metadata.transactionGroupId] = message

    return data

module.exports = SetMessageOnData
