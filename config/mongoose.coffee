mongoose = require 'mongoose'
fs = require 'fs'
path = require 'path'
async = require 'async'
config = require './../config'


mongoose.connect 'mongodb://' + config.get('mongoose:user') + ':' + config.get('mongoose:password') + '@' + config.get('mongoose:server') + '/' + config.get('mongoose:database')
db = mongoose.connection

db.on 'error', (error) ->
  console.log 'Connection error: ', error.message

db.once 'open', callback = ->
  console.log 'Connected to DB'

models = {}

init = (modelsDir, callback) ->
  schemaList = fs.readdirSync(modelsDir)
  async.each schemaList, ((item, cb) ->
    modelName = path.basename(item, '.coffee')
    models[modelName] = require(path.join(modelsDir, modelName))(mongoose)
    cb()
    return
  ), callback
  return

model = (modelName) ->
  name = modelName.toLowerCase()
  throw "Model '" + name + "' is not exist" if typeof models[name] is "undefined"
  models[name]

module.exports.init = init
module.exports.model = model